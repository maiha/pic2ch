require 'rubygems'
require 'pathname'
require 'dsl_accessor'

module Pic2ch
  dsl_accessor :root     , Dir.pwd, :writer=>proc{|dir| Pathname(dir)}
  dsl_accessor :url      , 'http://pic2ch.giox.org/' , :writer=>:parse_uri
  dsl_accessor :image_url, 'http://strage.giox.info/', :writer=>:parse_uri

  private
    def self.parse_uri(url)
      URI.parse(url)
    end
end


dir = File.dirname(__FILE__) + '/' + File.basename(__FILE__, '.rb') + '/'

require dir + 'thread'
require dir + 'pages'
require dir + 'parsers'
require dir + 'downloaders'
