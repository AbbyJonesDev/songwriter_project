require 'spec_helper'
Warden.test_mode!


feature "Manage resources from dashboard" do 

  before :each do
    @admin = FactoryGirl.create(:admin)
  end

  after :each do
    Warden.test_reset!
  end

  
  context "When not logged in as admin" do

    it "doesn't let non-admin view dashboard" do
      visit admin_path
      expect(current_path).to eq(new_admin_session_path) #For user to log in
    end

    it "takes admin to dashboard after logging in" do
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
      @song1 = FactoryGirl.create(:song, title: "Song 1")
      @song2 = FactoryGirl.create(:song, title: "Song 2")
      @song3 = FactoryGirl.create(:song, title: "Song 3")
      login_as(@admin, scope: :admin)
      visit admin_path
    end

    describe "Manage songs" do

      it "Shows a list of all songs" do
        @songs = [ @song1, @song2, @song3 ]
        @songs.each do | song |
          expect(page).to have_content(song.title)
        end
      end

      it "Provides quick links to view a song" do
        click_on("View", match: :first)
        expect(current_path).to eq(song_path(@song1))
      end

      it "Provides quick links to update a song" do
        click_on("Edit", match: :first)
        expect(current_path).to eq(edit_song_path(@song1))
      end

      it "Provides quick links to delete a song", js: true do
        expect do
          click_link('Delete', match: :first)
          page.evaluate_script('window.confirm = function() { return true; }')
        end.to change(Song, :count).by(-1)
      end

      it "Makes adding a new song easy" do
        click_on("Add Song")
        expect(current_path).to eq(new_song_path)
      end

    end
  
  end



  
end