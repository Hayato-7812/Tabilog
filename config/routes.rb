Rails.application.routes.draw do
  # ルートURLへのリクエストをWelcomeコントローラーのindexアクションにルーティング
  root 'welcome#index'
  
  get 'chat_room', to: 'chat_room#index', as: 'chat_room'
  post 'chat_room', to: 'chat_room#create'

  get 'share_room', to: 'share_room#index', as: 'share_room'
end
