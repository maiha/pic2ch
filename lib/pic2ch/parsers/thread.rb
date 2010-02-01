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

      # {id:'1243648801',urls:'54b14715c000a6334ad2e8771cbf70e8.jpg:1e611e8710dd60d616e345aa69334c2d.jpg:...'}
      def jpgs
        @jpgs ||= html.scan(/',urls:'(.*?)'/).first.first.split(/:/)
      end

      def time
        @time ||= html.scan(/\{id:'(\d+)',urls:'/).first.first.to_i
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
    end
  end
end
