require 'rails_helper'

RSpec.describe "ChatRoom", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/chat_room"
      expect(response).to have_http_status(:success)
    end
  end

end
