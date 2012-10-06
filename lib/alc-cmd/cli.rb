require 'thor'

module Alc; module Cmd
  class CLI < Thor
    desc "red WORD", "red words print."
    def red(word)
      say(word, :red)
    end

  end
end; end
