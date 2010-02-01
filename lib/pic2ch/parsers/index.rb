module Pic2ch
  module Parsers
    class Index
      module ElementParser
        def self.next_class_for(e, name, limit = 10, &block)
          limit.times do
            e = e.next or return nil
            next unless e["class"] == name.to_s
            return block ? block.call(e) : e
          end
          return nil
        end
      end

      def initialize(html)
        @html = html
      end

      def doc
        @doc ||= Nokogiri::HTML(@html)
      end

      def elements
        @elements ||= doc.xpath("/html/body/div[2]/div[2]/a")
      end

      def threads
        @threads ||= elements.map{|e| Pic2ch::Thread.new(*construct(e))}
      end

      def coded
        @coded ||= all.inject({}){|hash,obj| hash[obj.code] = obj; hash}
      end

      def pages
        @pages ||= doc.css("div.paginate a span.enable_page").map{|span| Pages::Index.new(span.text)}
      end

#       def get(code)
#         Static.new(code)
#       end

      def construct(e)
        [
         e.text,                # name
         e["href"],             # link
         ElementParser.next_class_for(e, :created){|e| e.text}, # created
         ElementParser.next_class_for(e, :star   ){|e| e.text}.to_i, # star
        ]
      end
    end
  end
end

