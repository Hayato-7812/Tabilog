require 'pycall'
require 'dotenv/load'

# GenerativeAiHandlerクラスの定義
class GenerativeAiHandler
  def initialize(model_name = "gemini-pro")
    @genai = PyCall.import_module('google.generativeai')
    Dotenv.load
    
    @genai.configure(api_key: ENV['GEMINI_API_KEY'])
    @gemini_pro = @genai.GenerativeModel.new(model_name)
  end

  def generate_content(prompt)
    response = @gemini_pro.generate_content(prompt)
    response.text
  end

  def ask_travel_plan(departure, destination, budget, night, other) 
    prompt = "You are special travel adviser. 
              Plan #{night}-night, #{night+1}-day trip to #{destination} from #{departure}, 
              budget up to #{budget} yen. #{other}"

    generated_text = generate_content(prompt)

    puts generated_text
  end
end

# 以下はプログラムの動作を確認するためのコード
# handler = GenerativeAiHandler.new
# handler.ask_travel_plan("Tokyo", "Osaka", 50000, 2, "I want to eat Takoyaki.")
