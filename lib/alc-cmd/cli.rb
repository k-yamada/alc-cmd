# encoding: UTF-8  
$LOAD_PATH << File.dirname(__FILE__)  
require 'thor'
require 'eijiro'

module Alc; module Cmd
  class CLI < Thor

    desc "s [WORD1 WORD2]", "serach words"
    def s(*words)

      Eijiro.new.search(words)
      #result = ""
      #eijiro = Eijiro.new(words)

      #eijiro.get_search_assistances.each do |assistance|
      #  result << set_color(assistance, :green) + "\n"
      #end

      #meanings = eijiro.get_meanings
      #eijiro.get_titles.each_with_index do |title, index|
      #  result << set_color(title, :yellow) + "\n"
      #  result << set_color(meanings[index]) + "\n"
      #end
      #result
    end

  end
end; end
