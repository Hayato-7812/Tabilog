# app/controllers/chat_room_controller.rb
require_relative '../services/gemini_travel_plan_generator.rb'
require_relative '../services/yolp_map_handler.rb'

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
    redirect_to generate_plan_result_path(description: URI.encode_www_form_component(description), plan: plan, total_fee: total_fee)
  end

  def generate_plan_result
    @description = URI.decode_www_form_component(params["description"])
    @plan = params["plan"]
    @total_fee = params["total_fee"]
    
    # for display map (send to JS)
    # すべてのstart_pointとgoal_pointを一つの集合として取得し、重複要素を削除して順番を保持する
    places = @plan.flat_map { |point| [point["start_point"], point["goal_point"]] }.uniq
    waypoints = []
    places.each do |point|
      response = contents_geocoder(point)
      next if response.nil?
      
      name = response[:Name][:text] 
      coordinates = response[:Geometry][:Coordinates][:text].split(',')

      waypoints << { 
        name: name,
        latitude: coordinates[0].to_f,
        longitude: coordinates[1].to_f
      }
    end
    gon.waypoints = waypoints
  end

  private
  
  def ai_handler
    @ai_handler ||= GeminiTravelPlanGenerator.new 
  end
  
  def map_handler
    @map_handler ||= YolpMapHandler.new
  end

  def generate_travel_plan(departure, destination, budget, nights, other)
    ai_handler.generate_plan(departure, destination, budget, nights, other)
  end

  def contents_geocoder(query)
    map_handler.contents_geocoder(query)
  end
end
