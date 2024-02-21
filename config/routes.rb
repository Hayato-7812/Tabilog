Rails.application.routes.draw do
  # ルートURLへのリクエストをWelcomeコントローラーのindexアクションにルーティング
  root 'welcome#index'

  # 旅行計画を立てるためのフォーム表示用のルーティング
  get '/plan_trip', to: 'trip_planner#new'
  # 旅行計画の作成処理用のルーティング
  post '/plan_trip', to: 'trip_planner#create'
end
