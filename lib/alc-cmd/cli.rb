# encoding: UTF-8  
$LOAD_PATH << File.dirname(__FILE__)  
require 'thor'
require 'eijiro'

module Alc; module Cmd
  class CLI < Thor

    desc "s [WORD1 WORD2]", "serach words"
    def s(*words)
      Eijiro.new.search(words)
    end

  end
end; end
