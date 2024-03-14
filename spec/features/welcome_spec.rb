# spec/features/welcome_spec.rb

# Load rails_helper to use Rails helper methods
require 'rails_helper'

# Define feature spec about the Welcome page
RSpec.feature 'Welcome Page', type: :feature do
  # Define scenario where Welcome page is displayed correctly
  scenario 'Welcome page is displayed correctly' do
    # Visit the Welcome page
    visit root_path

    # Verify that the page displays the text " CHAT"
    expect(page).to have_content('CHAT')

    # Verify that the page displays the text "SHARE"
    expect(page).to have_content('SHARE')
  end

  scenario 'Header is not displayed on root path' do
    visit root_path

    expect(page).not_to have_css('header')
  end
end
