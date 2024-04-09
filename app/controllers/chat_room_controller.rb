# app/controllers/chat_room_controller.rb
require_relative '../services/gemini_travel_plan_generator.rb'

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
    total_fee = 0
    response["plan"].each do |point|
      total_fee += point["fee"].to_i
    end
    description = response["description"]
    plan = response["plan"]
    redirect_to generate_plan_result_path(description: description, plan: plan, total_fee: total_fee)
  end

  def generate_plan_result
    @description = params["description"]
    @plan = params["plan"]
    @total_fee = params["total_fee"]
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
