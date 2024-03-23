class ChatRoomController < ApplicationController
  def index
  end

  def generate_plan
    # フォームから送られたパラメータを取得
    departure = params[:departure]
    destination = params[:destination]
    budget = params[:budget]
    nights = params[:nights]
    other = params[:other]

    # 旅行計画を生成するメソッドを呼び出し
    plan = create_travel_plan(departure, destination, budget, nights, other)

    respond_to do |format|
      format.html
      format.json { render json: plan }
    end
  end

  private

  def create_travel_plan(departure, destination, budget, nights, other)
    ai_handler = GenerativeAiHandler.new
    plan = ai_handler.ask_travel_plan(departure, destination, budget, nights, other)
    return plan
  end
end
