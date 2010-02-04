module Pic2ch
  class Thread
    class Static < Thread
      attr_reader :code
      attr_reader :url

      def initialize(code)
        @code = code.to_i
        @url  = Pic2ch.url + "/thread/#{@code}"
      end
    end
  end
end
