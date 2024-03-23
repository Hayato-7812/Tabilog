require 'rails_helper'

RSpec.describe GenerativeAiHandler, type: :handler do
  describe "#generate_content" do
    # When testing using an API, change 'xit' to 'it'.
    xit "generates content successfully" do
      handler = GenerativeAiHandler.new
      generated_text = handler.ask_travel_plan("Tokyo", "Osaka", 50000, 2, "I want to eat Takoyaki.")
      puts generated_text
      expect(generated_text).to be_present
    end
  end
end
