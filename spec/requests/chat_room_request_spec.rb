require 'rails_helper'

RSpec.describe "ChatRoom", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/chat_room"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /generate_plan" do
    xit "redirects to generate_plan_result" do
      post '/chat_room/generate_plan' , params: { departure: "Tokyo", destination: "Osaka", budget: 50000, nights: 2, other: "Sightseeing" }
      expect(response).to have_http_status(:redirect)
    end
  end

end
