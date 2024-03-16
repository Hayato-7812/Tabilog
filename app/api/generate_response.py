from dotenv import load_dotenv
import os
import google.generativeai as genai

# .envファイルから環境変数を読み込む
load_dotenv()

# 環境変数に GOOGLE_API_KEY が設定されていれば不要
GOOGLE_API_KEY=os.getenv('GOOGLE_API_KEY')
genai.configure(api_key=GOOGLE_API_KEY)

gemini_pro = genai.GenerativeModel("gemini-pro")