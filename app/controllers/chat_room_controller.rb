# app/controllers/chat_room_controller.rb
require_relative '../apis/gemini_content_generator.rb'

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
    response = generate_travel_plan(departure, destination, budget, nights, other)
    puts response if response
    redirect_to generate_plan_result_path(response: response)
  end

  def generate_plan_result
    @plan = JSON.pretty_generate(params["response"])
  end

  private

  def generate_travel_plan(departure, destination, budget, nights, other)
    plan = ai_handler.generate_plan(departure, destination, budget, nights, other)
    return plan
  end

  def ai_handler
    @ai_handler ||= GeminiTravelPlanGenerator.new 
  end
end
