require 'thor'
require 'mechanize'
require 'uri'

module Alc; module Cmd
  class Eijiro < Thor::Shell::Color
    BASE_URI = "http://eow.alc.co.jp/"
    CHAR_CODE = "/UTF-8/"

    def initialize()
      @agent = Mechanize.new
    end

    def search(words)
      @agent.get(make_uri_from_words(words))
      @words = words
      result = ""
      get_search_assistances.each do |assistance|
        result << set_color(assistance, :green) + "\n"
      end

      meanings = get_meanings
      get_titles.each_with_index do |title, index|
        result << set_color(title, :yellow) + "\n"
        result << set_color(meanings[index]) + "\n"
      end
      result
    end

    def make_uri_from_words(words)
      return BASE_URI + make_query_from_words(words) + CHAR_CODE
    end

    def make_query_from_words(words)
      return words.map { |param| URI.encode(param) }.join('+')
    end

    def get_search_assistances
      assistances = []
      @agent.page.search('div.sas strong').map do |h|
        assistances << h.inner_text.chomp("\t\t\t\t\t\t")
      end
      assistances
    end

    def get_titles
      return @agent.page.search('li span.midashi').map do |midashi|
        inner_text = midashi.inner_text
      end
    end

    def get_meanings
      meanings = Array.new
      @agent.page.search('li div').each do |div|
        lis = div.search('li')
        if lis.size != 0
          meanings << lis.inject('') { |text, li| text + "  " + li.inner_text + "\n" }
        else
          meanings << "  " + div.inner_text
        end
      end
      return meanings
    end

  end
end; end
