require 'net/http'
require 'json'
require 'dotenv/load'

class GeminiTravelPlanGenerator
    API_KEY = ENV['GEMINI_API_KEY'].freeze
    DATA_FILE = 'app/apis/system_prompt.json'.freeze
  
    def generate_plan(departure, destination, budget, nights, other)
      uri = build_uri
      data = load_data_from_file
      input_text = build_input_text(departure, destination, budget, nights, other)
      append_input_text(data, input_text)
      response = send_request(uri, data)
      parse_response(response)
    end
  
    private
  
    def build_uri
      URI.parse("https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=#{API_KEY}")
    end
  
    def load_data_from_file
      JSON.parse(File.read(DATA_FILE))
    end
  
    def build_input_text(departure, destination, budget, nights, other)
      {
        input: {
          departure: departure,
          destination: destination,
          budget: budget,
          nights: nights,
          other: other
        }
      }.to_json
    end
  
    def append_input_text(data, input_text)
      data["contents"][0]["parts"] << { "text": input_text }
    end
  
    def send_request(uri, data)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri, { 'Content-Type': 'application/json' })
      request.body = data.to_json
      http.request(request)
    end
  
    def parse_response(response)
      if response.code == '200'
        result_hash = JSON.parse(response.body)
        text = result_hash['candidates'][0]['content']['parts'][0]['text']
        formatted_text_data = text.gsub(/[\n\s]+/, '')
        JSON.parse(formatted_text_data)
      else
        raise "Error: #{response.code} - #{response.message}"
      end
    end
end

# Usage
# handler = GeminiTravelPlanGenerator.new
# response = handler.generate_plan('東京駅', '千葉', 30000, '1泊', '観光')
# puts response if response
  