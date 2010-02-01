module Pic2ch
  class Thread
    class Static < Thread
      def initialize(code)
        @code = code.to_i
        @url  = self.class.url + "/thread/#{@code}"
      end
    end
  end
end
