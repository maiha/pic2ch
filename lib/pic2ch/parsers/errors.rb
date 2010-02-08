module Pic2ch
  module Parsers
    ParseError  = Class.new(RuntimeError)
    DeletedPage = Class.new(ParseError)
    class NotFound < ParseError
      def initialize(attr)
        @attr = attr
      end

      def message
        "#{@attr} is not found"
      end
    end
  end
end
