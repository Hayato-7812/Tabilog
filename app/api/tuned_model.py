import os
from dotenv import load_dotenv
from google.auth.transport.requests import Request
from google.oauth2.credentials import Credentials
import google.generativeai as genai

# .envファイルの読み込み
load_dotenv()

genai.configure(api_key=os.getenv('GEMINI_API_KEY'))

# Set up the model
generation_config = {
  "temperature": 0.9,
  "top_p": 1,
  "top_k": 1,
  "max_output_tokens": 2048,
}

safety_settings = [
  {
    "category": "HARM_CATEGORY_HARASSMENT",
    "threshold": "BLOCK_MEDIUM_AND_ABOVE"
  },
  {
    "category": "HARM_CATEGORY_HATE_SPEECH",
    "threshold": "BLOCK_MEDIUM_AND_ABOVE"
  },
  {
    "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
    "threshold": "BLOCK_MEDIUM_AND_ABOVE"
  },
  {
    "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
    "threshold": "BLOCK_MEDIUM_AND_ABOVE"
  },
]

model = genai.GenerativeModel(model_name="gemini-1.0-pro",
                              generation_config=generation_config,
                              safety_settings=safety_settings)

prompt_parts = [
  "## Instructions\nYou are a special advisor who proposes a travel plan based on the given criteria.(answer in Japanese)\nGenerate a solution in the following format(Generate answers in json format since it will be operated as an API.)\nPlease do not add unnecessary strings to the answer, and only generate the answer in json format.\n\n\ninput = {             \n             departure :  \n             destination:\n             budget：\n             nights：\n             other：        \n}\n\noutput = {             \n     \"plan\": [\n        {\n            \"subject\": \"\", # Type of activity (e.g., travel, sightseeing, meals, lodging, etc.)\n            \"start_point\": \"\", # Point of departure\n            \"goal_point\": \"\", # Arrival point\n            \"transportation\": \"\", # means of transportation (e.g. train, bullet train, walking, bus, etc.)\n            \"fee\": 0, # Cost (in yen)\n            \"time\": 0 # Time required (minutes)\n        },.\n        # Add other activities as well\n    ]   \"description\": }",
  "Travel Conditions \"departure\": \"新宿駅\",\n\"budget\": \"50000yen\",\n\"nights\": \"2泊\",\n \"other\": \"ショッピング\"",
  "output:Attractive Travel Planning {\n    \"output\": {\n        \"plan\": [\n            {\n                \"subject\": \"移動\",\n                \"start_point\": \"札幌駅\",\n                \"goal_point\": \"大通り駅\",\n                \"transportation\": \"地下鉄\",\n                \"fee\": 250,\n                \"time\": 15\n            },\n            {\n                \"subject\": \"観光\",\n                \"start_point\": \"大通公園\",\n                \"goal_point\": \"大通公園\",\n                \"transportation\": \"\",\n                \"fee\": 0,\n                \"time\": 90\n            },\n            {\n                \"subject\": \"宿泊\",\n                \"start_point\": \"札幌ホテル\",\n                \"goal_point\": \"札幌ホテル\",\n                \"transportation\": \"\",\n                \"fee\": 10000,\n                \"time\": null\n            },\n            {\n                \"subject\": \"移動\",\n                \"start_point\": \"大通り駅\",\n                \"goal_point\": \"札幌駅\",\n                \"transportation\": \"地下鉄\",\n                \"fee\": 250,\n                \"time\": 15\n            }\n        ],\n        \"description\": \"札幌から大通りへの移動後、観光を楽しんだ後、札幌のホテルで1泊の宿泊を予約してから札幌に戻ります。\"\n    }\n}",
  "Travel Conditions {\n    \"input\": {\n        \"departure\": \"名古屋駅\",\n        \"budget\": 40000,\n        \"nights\": \"1泊\",\n        \"other\": \"歴史巡り\"\n    }\n}",
  "output:Attractive Travel Planning {\n    \"output\": {\n        \"plan\": [\n            {\n                \"subject\": \"移動\",\n                \"start_point\": \"名古屋駅\",\n                \"goal_point\": \"熱田神宮駅\",\n                \"transportation\": \"電車\",\n                \"fee\": 200,\n                \"time\": 20\n            },\n            {\n                \"subject\": \"観光\",\n                \"start_point\": \"熱田神宮\",\n                \"goal_point\": \"熱田神宮\",\n                \"transportation\": \"\",\n                \"fee\": 0,\n                \"time\": 60\n            },\n            {\n                \"subject\": \"宿泊\",\n                \"start_point\": \"名古屋ホテル\",\n                \"goal_point\": \"名古屋ホテル\",\n                \"transportation\": \"\",\n                \"fee\": 15000,\n                \"time\": null\n            },\n            {\n                \"subject\": \"移動\",\n                \"start_point\": \"熱田神宮駅\",\n                \"goal_point\": \"名古屋駅\",\n                \"transportation\": \"電車\",\n                \"fee\": 200,\n                \"time\": 20\n            }\n        ],\n        \"description\": \"名古屋から熱田神宮への移動後、歴史巡りを楽しんだ後、名古屋のホテルで1泊の宿泊を予約してから名古屋に戻ります。\"\n    }\n}",
  "Travel Conditions {\n    \"input\": {\n        \"departure\": \"東京駅\",\n        \"budget\": 50000,\n        \"nights\": \"2泊\",\n        \"other\": \"ショッピング\"\n    }\n}",
  "output:Attractive Travel Planning {\n    \"output\": {\n        \"plan\": [\n            {\n                \"subject\": \"移動\",\n                \"start_point\": \"東京駅\",\n                \"goal_point\": \"渋谷駅\",\n                \"transportation\": \"電車\",\n                \"fee\": 150,\n                \"time\": 10\n            },\n            {\n                \"subject\": \"ショッピング\",\n                \"start_point\": \"渋谷109\",\n                \"goal_point\": \"渋谷109\",\n                \"transportation\": \"\",\n                \"fee\": 25000,\n                \"time\": 120\n            },\n            {\n                \"subject\": \"宿泊\",\n                \"start_point\": \"渋谷ホテル\",\n                \"goal_point\": \"渋谷ホテル\",\n                \"transportation\": \"\",\n                \"fee\": 20000,\n                \"time\": null\n            },\n            {\n                \"subject\": \"移動\",\n                \"start_point\": \"渋谷駅\",\n                \"goal_point\": \"東京駅\",\n                \"transportation\": \"電車\",\n                \"fee\": 150,\n                \"time\": 10\n            }\n        ],\n        \"description\": \"東京から渋谷への移動後、ショッピングを楽しんだ後、渋谷のホテルで2泊の宿泊を予約してから東京に戻ります。\"\n    }\n}",
  "Travel Conditions {\n    \"input\": {\n        \"departure\": \"札幌駅\",\n        \"budget\": 20000,\n        \"nights\": \"1泊\",\n        \"other\": \"観光\"\n    }\n}",
  "output:Attractive Travel Planning ",
]

response = model.generate_content(prompt_parts)
print(response.text)