require 'rails_helper'

RSpec.describe GenerativeAiHandler, type: :handler do
  describe "#generate_content" do
    # When testing using an API, change 'xit' to 'it'.
    xit "generates content successfully" do
      handler = GenerativeAiHandler.new
      prompt = "Please output just only 'Tabilog'"
      generated_text = handler.generate_content(prompt)
      
      expect(generated_text).to be_present
      expect(generated_text).to eq ("Tabilog")
    end
  end
end
