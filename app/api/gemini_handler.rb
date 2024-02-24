require 'pycall/import'
include PyCall::Import

# 認証情報を取得
auth_credential = 'path/to/your/google/cloud/credentials.json'

# Pythonのコードを定義する際に、認証情報を渡す
python_code = <<~PYTHON
import os
import google.generativeai as genai

# 認証情報を指定
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "#{auth_credential}"

# GenerativeAIを設定
genai.configure(api_key=None)

# GenerativeModelオブジェクトを作成
model = genai.GenerativeModel(model_name='gemini-pro')
chat = model.start_chat()
response = chat.send_message('Googleが提供する「Gemini Pro」について教えてください。')
response.text
PYTHON

# PyCallを使用してPythonコードを実行する
PyCall.exec(python_code)
