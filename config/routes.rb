Rails.application.routes.draw do
  # ルートURLへのリクエストをWelcomeコントローラーのindexアクションにルーティング
  root 'welcome#index'
  
  get 'chat_room', to: 'chat_room#index', as: 'chat_room'

end
