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
end

# GenerativeAiHandlerのインスタンスを作成
ai_handler = GenerativeAiHandler.new

# 任意のプロンプトを指定してgenerate_contentメソッドを呼び出す
prompt = "You are special travel adviser. response to japanese.
I am planning a two-night, three-day trip to Kyoto from Tokyo with a budget of up to 50,000 yen. 
I would like to see traditional buildings in Kyoto as much as possible."

generated_text = ai_handler.generate_content(prompt)

# 生成されたテキストを表示
puts generated_text
