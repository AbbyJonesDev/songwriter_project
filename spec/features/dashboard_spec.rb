require 'spec_helper'
Warden.test_mode!

feature "Manage resources from dashboard" do 

  before :each do
    @admin = FactoryGirl.create(:admin)
    @song1 = FactoryGirl.create(:song, title: "Song 1")
    @song2 = FactoryGirl.create(:song, title: "Song 2")
    @song3 = FactoryGirl.create(:song, title: "Song 3")
  end

  
  context "When not logged in as admin" do

    scenario "Non admin can't view dashboard" do
      visit admin_path
      expect(current_path).to eq(new_admin_session_path) #For user to log in
    end

    scenario "Log in to admin dashboard" do
      visit '/'
      click_on("Admin Login")  
      expect(current_path).to eq(new_admin_session_path)
      fill_in("Email", with: @admin.email)
      fill_in("Password", with: "password")
      click_on("Sign in")
      expect(current_path).to eq(admin_path)
      within 'h1' do
        expect(page).to have_content("Dashboard")
      end
    end

  end


  context "When logged in as admin" do
    before :each do
      login_as(@admin, scope: :admin)
    end

    scenario "View song list" do
      visit admin_path
      expect(page).to have_content(["Song 1", "Song 2", "Song 3"])
    end
  end










  
end