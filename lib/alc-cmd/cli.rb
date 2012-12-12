# encoding: UTF-8  
$LOAD_PATH << File.dirname(__FILE__)  
require 'thor'
require 'eijiro'

module Alc; module Cmd
  class CLI < Thor

    desc "s [WORD1 WORD2]", "serach words"
    def s(*words)
      result = Eijiro.new.search(words)
      show_console(result)
    end

    private

    def show_console(text)
      tmp_file_name = "/tmp/alc.temp" + Time.now.to_f.ceil.to_s
      File.open(tmp_file_name, "w") do |file| file.write(text) end
      system("less -R #{tmp_file_name}")
      system("rm -rf #{tmp_file_name}")
    end

  end
end; end
