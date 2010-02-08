module Pic2ch
  module Parsers
    class Thread
      delegate :image_url, :to=>"Pic2ch"
      delegate :url, :to=>"@thread"

      def initialize(thread)
        @thread = thread
      end

      def html
        @html ||= open(url).read{}
      end

      def doc
        @doc ||= Nokogiri::HTML(html)
      end

      def deleted?
        check_deleted
        return false
      rescue DeletedPage
        return true
      end

      def count
        unless @count
          check_deleted
          count = doc.css('h2').text.scan(/\((\d+)\)$/).flatten.first.to_s
          raise NotFound, "count" if count.empty?
          @count = count.to_i
        end
        return @count
      end

      def jpgs
        unless @jpgs
          check_deleted
          urls = extract(:urls).split(/:/)
          raise ParseError, "expected #{count} urls exist, but got #{urls.size}" unless urls.size == count
          @jpgs = urls
        end
        return @jpgs
      end

      def time
        @time ||= extract(:id).to_i
      end

      def title
        @title ||= doc.search("title").text
      end

      def thumbs
        @thumbs ||= jpgs.map{|jpg| image_url + "/thumbs/#{time}/#{jpg}" }
      end

      def images
        @images ||= jpgs.map{|jpg| image_url + "/pics3/#{time}/#{jpg}" }
      end

      def images_with_thumbs
        @images_with_thumbs ||= [images, thumbs].transpose
      end

      private
        def check_deleted
          raise DeletedPage if html =~ /このスレッドは削除されました/
        end

        def extract(key)
          # {id:'1243648801',urls:'54b14715c000a6334ad2e8771cbf70e8.jpg:1e611e8710dd60d616e345aa69334c2d.jpg:...'}
          if html =~ /(\{|'\s*,)\s*#{key}:'(.*?)'/
              return $2.to_s
          else
            raise NotFound, key.to_s
          end
        end
    end
  end
end
