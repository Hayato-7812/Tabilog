Rails.application.routes.draw do
  # ルートURLへのリクエストをWelcomeコントローラーのindexアクションにルーティング
  root 'welcome#index'
  
  get 'chat_room', to: 'chat_room#index', as: 'chat_room'
  get 'share_room', to: 'share_room#index', as: 'share_room'

  post 'chat_room/generate_plan', to: 'chat_room#generate_plan', as: 'generate_plan'

  # 生成結果ページのルート
  get 'chat_room/generate_plan_result', to: 'chat_room#generate_plan_result' , as: 'generate_plan_result'
end
