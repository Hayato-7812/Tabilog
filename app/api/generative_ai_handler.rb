require 'pycall'

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
