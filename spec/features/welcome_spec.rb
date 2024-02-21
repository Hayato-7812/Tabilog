# spec/features/welcome_spec.rb

# Railsのヘルパーメソッドを使用するためにrails_helperを読み込む
require 'rails_helper'

# Welcomeページに関するフィーチャースペックを定義する
RSpec.feature "Welcomeページ", type: :feature do
  # Welcomeページが正常に表示されるシナリオを定義する
  scenario "Welcomeページが正常に表示される" do
    # Welcomeページにアクセスする
    visit root_path

    # "Welcome to Tabilog"というテキストがページに表示されていることを確認する
    expect(page).to have_content("Welcome to Tabilog")

    # "Start planning your next adventure now!"というテキストがページに表示されていることを確認する
    expect(page).to have_content("Start planning your next adventure now!")

    # "Get Started"というテキストを持つボタンがページに表示されていることを確認する
    expect(page).to have_content("Get Started")
  end
end
