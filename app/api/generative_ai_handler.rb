require 'pycall'
require 'dotenv/load'
require 'json'

# GenerativeAiHandlerクラスの定義
class GenerativeAiHandler
  attr_accessor :system_prompt

  def initialize(model_name = "gemini-pro")
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
      "max_output_tokens": 2048,
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
      },
    ]
  end
  
  def system_prompt
    @system_prompt ||= File.read("app/api/system_prompt.txt")  
  end

  def generate_content(prompt)
    response = @gemini_pro.generate_content(prompt)
    # JSONをパースしてハッシュに変換
    JSON.parse(response.text)
  end

  def ask_travel_plan(departure, destination, budget, nights, other) 
    # output : hash

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