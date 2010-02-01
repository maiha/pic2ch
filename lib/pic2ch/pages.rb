module Pic2ch
  module Pages
    def self.index(p = 1)
      Index.new(p)
    end

    def self.threads
      index.threads
    end
  end

  def self.pages
    Pages
  end
end

dir = File.dirname(__FILE__) + '/' + File.basename(__FILE__, '.rb') + '/'

require dir + 'index'
