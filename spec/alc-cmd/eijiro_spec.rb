require 'spec_helper'

module Alc; module Cmd
  describe Eijiro do
    it "make query from words" do
      query = Eijiro.new().make_query_from_words(["test", "what"])
      query.should == "test+what"
    end
  end
end; end
