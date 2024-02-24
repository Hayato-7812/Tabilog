from dotenv import load_dotenv
import os
import google.generativeai as genai

# .envファイルから環境変数を読み込む
load_dotenv()

# 環境変数に GOOGLE_API_KEY が設定されていれば不要
GOOGLE_API_KEY=os.getenv('GOOGLE_API_KEY')
genai.configure(api_key=GOOGLE_API_KEY)
print(GOOGLE_API_KEY)

# 生きる意味を聞いてみる
gemini_pro = genai.GenerativeModel("gemini-pro")
prompt = "What is the meaning of life?"
response = gemini_pro.generate_content(prompt)
print(response.text)