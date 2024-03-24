require 'rails_helper'

RSpec.describe GeminiTravelPlanGenerator do
  describe "#generate_plan" do
    it "returns a non-empty response" do
      handler = GeminiTravelPlanGenerator.new
      response = handler.generate_plan('東京駅', '千葉', 30000, '1泊', '観光')
      expect(response).to be_present
    end
  end
end
