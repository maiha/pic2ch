module Pic2ch
  module Pages
    class Index
      attr_reader :p
      
      def initialize(p)
        @p = p.to_i
        @p = 1 if @p < 1
      end

      ######################################################################
      ### Accessors

      def url
        Pic2ch.url + path
      end

      def path
        p == 1 ? '' : "/?p=#{p}"
      end

      ######################################################################
      ### Fetch

      def html
        @html ||= open(url).read{}
      end

      ######################################################################
      ### Parsers
      def parser
        @parser ||= Parsers::Index.new(html)
      end

      delegate :threads, :pages, :to=>"parser"
    end
  end
end
