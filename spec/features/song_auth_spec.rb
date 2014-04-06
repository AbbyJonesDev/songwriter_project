require 'spec_helper'
Warden.test_mode!

feature "Admin must be logged in to create or update songs" do

  before :each do
    @song = FactoryGirl.create(:song)
    @admin = FactoryGirl.create(:admin)
    login_as(@admin, scope: :admin)
  end

  after :each do
    Warden.test_reset!
  end

  scenario 'visit new song page' do
    visit new_song_path
    expect(page).to have_content("New")
  end

end

# feature 'Visitor signs up' do
#   scenario 'with valid email and password' do
#     sign_up_with 'valid@example.com', 'password'

#     expect(page).to have_content('Sign out')
#   end

#   scenario 'with invalid email' do
#     sign_up_with 'invalid_email', 'password'

#     expect(page).to have_content('Sign in')
#   end

#   scenario 'with blank password' do
#     sign_up_with 'valid@example.com', ''

#     expect(page).to have_content('Sign in')
#   end

#   def sign_up_with(email, password)
#     visit sign_up_path
#     fill_in 'Email', with: email
#     fill_in 'Password', with: password
#     click_button 'Sign up'
#   end
