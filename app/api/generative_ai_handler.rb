require 'pycall'
require 'dotenv/load'
require 'json'
require 'timeout'

class GenerativeAiHandler
  attr_accessor :system_prompt

  def initialize(model_name = "gemini-1.0-pro")
    @genai = PyCall.import_module('google.generativeai')
    Dotenv.load
    
    @genai.configure(api_key: ENV['GEMINI_API_KEY'])

    @gemini_pro = @genai.GenerativeModel.new(
                    model_name,
                    generation_config: generation_config,
                    safety_settings: safety_settings
                  )
  end

  def generation_config 
    @generation_config ||= {
      "temperature": 0.9,
      "top_p": 1,
      "top_k": 1,
      "max_output_tokens": 2048
    }  
  end

  def safety_settings
    @safety_settings ||= [
      {
        "category": "HARM_CATEGORY_HARASSMENT",
        "threshold": "BLOCK_MEDIUM_AND_ABOVE"
      },{
        "category": "HARM_CATEGORY_HATE_SPEECH",
        "threshold": "BLOCK_MEDIUM_AND_ABOVE"
      },{
        "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
        "threshold": "BLOCK_MEDIUM_AND_ABOVE"
      },{
        "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
        "threshold": "BLOCK_MEDIUM_AND_ABOVE"
      }
    ]
  end
  
  def system_prompt
    @system_prompt ||= File.read("app/api/system_prompt.txt")  
  end

  def generate_content(prompt)
    response = @gemini_pro.generate_content(prompt)
    JSON.parse(response.text.gsub('```json', '').gsub('```', ''))
    # return {"description"=>"東京から新幹線で大阪へ移動し、2泊をユニバーサルスタジオジャパンのホテルで過ごします。1日目はユニバーサルスタジオジャパンを満喫し、2日目は地下鉄で梅田と難波を観光します。大阪からはリムジンバスで大阪に戻ります。", "plan"=>[{"subject"=>"移動", "start_point"=>"Tokyo", "goal_point"=>"Osaka", "transportation"=>"新幹線", "fee"=>"14430", "time"=>"120"}, {"subject"=>"ホテル", "start_point"=>"USJホテル", "goal_point"=>"USJホテル", "transportation"=>"", "fee"=>"15000", "time"=>""}, {"subject"=>"観光", "start_point"=>"USJホテル", "goal_point"=>"USJ", "transportation"=>"徒歩", "fee"=>"0", "time"=>"10"}, {"subject"=>"観光", "start_point"=>"USJ", "goal_point"=>"USJ", "transportation"=>"", "fee"=>"0", "time"=>"300"}, {"subject"=>"移動", "start_point"=>"梅田", "goal_point"=>"難波", "transportation"=>"地下鉄", "fee"=>"300", "time"=>"15"}, {"subject"=>"観光", "start_point"=>"道頓堀", "goal_point"=>"道頓堀", "transportation"=>"", "fee"=>"0", "time"=>"120"}, {"subject"=>"移動", "start_point"=>"天王寺", "goal_point"=>"USJホテル", "transportation"=>"地下鉄", "fee"=>"270", "time"=>"20"}, {"subject"=>"移動", "start_point"=>"USJホテル", "goal_point"=>"Osaka", "transportation"=>"リムジンバス", "fee"=>"1000", "time"=>"45"}]}
  end

  def ask_travel_plan(departure, destination, budget, nights, other) 
    prompt = system_prompt + {
      input: {             
          departure:  departure,
          destination: destination,
          budget: budget,
          nights: nights,
          other: other        
      }
    }.to_s

    response = generate_content(prompt)
    puts response
    return response
  end
end

# 以下はプログラムの動作を確認するためのコード
# handler = GenerativeAiHandler.new
# handler.ask_travel_plan("Tokyo", "Osaka", 50000, 2, "I want to eat Takoyaki.")
