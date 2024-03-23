Rails.application.routes.draw do
  # ルートURLへのリクエストをWelcomeコントローラーのindexアクションにルーティング
  root 'welcome#index'
  
  resources :chat_room, only: [:index, :create] # chat_roomのindexとcreateアクションにルーティング
  resources :share_room, only: [:index] # share_roomのindexアクションにルーティング

  post '/chat_room/generate_plan', to: 'chat_room#generate_plan', as: 'generate_plan'
end
