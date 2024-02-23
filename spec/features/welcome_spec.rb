# spec/features/welcome_spec.rb

# Load rails_helper to use Rails helper methods
require 'rails_helper'

# Define feature spec about the Welcome page
RSpec.feature 'Welcome Page', type: :feature do
  # Define scenario where Welcome page is displayed correctly
  scenario 'Welcome page is displayed correctly' do
    # Visit the Welcome page
    visit root_path

    # Verify that the page displays the text "Welcome to Tabilog"
    expect(page).to have_content('Welcome to Tabilog')

    # Verify that the page displays the text "Start planning your next adventure now!"
    expect(page).to have_content('Start planning your next adventure now!')

    # Verify that a button with text "Get Started" is displayed on the page
    expect(page).to have_content('Get Started')
  end
end
