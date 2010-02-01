module Pic2ch
  class Thread
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
  end
end
