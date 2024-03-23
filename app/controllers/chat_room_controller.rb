# app/controllers/chat_room_controller.rb
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
    redirect_to generate_plan_result_path(plan: plan)
  end

  def generate_plan_result
    @plan = JSON.pretty_generate(params["plan"])
  end

  private

  def create_travel_plan(departure, destination, budget, nights, other)
    plan = ai_handler.ask_travel_plan(departure, destination, budget, nights, other)
    return plan
  end

  def ai_handler
    @ai_handler ||= GenerativeAiHandler.new 
  end
end
