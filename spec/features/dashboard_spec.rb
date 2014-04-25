require 'spec_helper'
Warden.test_mode!


feature "Manage resources from dashboard" do 

  let!(:song1) { FactoryGirl.create(:song, title: "Song 1") }
  let!(:song2) { FactoryGirl.create(:song, title: "Song 2") }
  let!(:song3) { FactoryGirl.create(:song, title: "Song 3") }
  let!(:article1) { FactoryGirl.create(:article, title: "Article 1") }
  let!(:article2) { FactoryGirl.create(:article, title: "Article 2") }
  let!(:article3) { FactoryGirl.create(:article, title: "Article 3") }

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
      login_admin
      expect(current_path).to eq(admin_path)
      within 'h1' do
        expect(page).to have_content("Dashboard")
      end
    end

  end


  context "When logged in as admin" do
    before :each do
      login_admin
    end

    describe "Manage account details" do
      before :each do
        click_on("Manage Account Details")
      end

      it "Allows admin to change password" do
        fill_in("Current password", with: @admin.password)
        fill_in("Password", with: "newpassword")
        fill_in("Password confirmation", with: "newpassword")
        click_on("Update")
        expect(page).to have_content"Account updated successfully"
        expect(@admin.password).to eq("newpassword")
      end

      it "Allows admin to change email address" do
        fill_in("Email", with: "newaddress@email.com")
        click_on("Update")
        expect(@admin.email).to eq("newaddress@email.com")
      end

      it "Allows admin to change name" do
        fill_in("Name", with: "Admin Name")
        click_on("Update")
        expect(@admin.name).to eq("Admin Name")
      end
    end

    describe "Manage songs" do

      it "Shows a list of all songs" do
        songs = [ song1, song2, song3 ]
        songs.each do | song |
          expect(page).to have_content(song.title)
        end
      end

      it "Provides quick links to view a song" do
        click_on("View", match: :first)
        expect(current_path).to eq(song_path(song1))
      end

      it "Provides quick links to update a song" do
        click_on("Edit", match: :first)
        expect(current_path).to eq(edit_song_path(song1))
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