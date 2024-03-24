require 'rails_helper'

RSpec.describe GeminiTravelPlanGenerator, type: :model do
  describe "#generate_plan" do
    xit "returns a non-empty response" do
      handler = GeminiTravelPlanGenerator.new
      response = handler.generate_plan('東京駅', '千葉', 30000, 1, '観光')
      puts response if response
      expect(response).to be_present
    end
  end
end
