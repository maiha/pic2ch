require 'open-uri'
require 'nokogiri'

module Pic2ch
  Thread = Struct.new(:name, :link, :created, :star)
  class Thread
    ######################################################################
    ### Accessors

    def url
      Pic2ch.url + link
    end

    def code
      link.to_s.scan(/\d+/).flatten.first.to_i
    end

    ######################################################################
    ### Parser

    def parser
      @parser ||= Parsers::Thread.new(self)
    end

    delegate :jpgs, :thumbs, :images, :title, :to=>"parser"

    ######################################################################
    ### Downloader

    def downloader
      Downloaders::Thread.new(self)
    end

    def download
      Dir.chdir(Pic2ch.root) do
        downloader.execute
      end
    end
  end
end

