require 'spec_helper'
Warden.test_mode!

feature "Admin must be logged in to create or update songs" do

  before :each do
    @song = FactoryGirl.create(:song)
  end
  after :each do
    Warden.test_reset!
  end


  context "visitor is not an admin" do
    scenario "song pages have no new link" do
      visit songs_path
      expect(page).to have_no_link('New')

      visit song_path(@song)
      expect(page).to have_no_link('New')
    end

    scenario "visitor attempts to visit new_song_path" do
      visit new_song_path
      expect(current_path).to eq(new_admin_session_path)
    end

    scenario "song pages have no edit link" do
      visit songs_path
      expect(page).to have_no_link("Edit")

      visit song_path(@song)
      expect(page).to have_no_link('Edit')
    end

    scenario "visitor attempts to visit edit_song_path" do
      visit edit_song_path(@song)
      expect(current_path).to eq(new_admin_session_path)
    end

  end


  context "admin is logged in" do
    before :each do
      @admin = FactoryGirl.create(:admin)
      login_as(@admin, scope: :admin)
    end

    scenario "add a new song" do
      visit new_song_path
      fill_in_valid_song
      click_on("Create Song")
      expect(page).to have_content("Song was successfully created")
    end

    scenario "update a song" do
      visit edit_song_path(@song)
      fill_in("Title", with: "New Title for Song")
      click_on("Update Song")
      expect(current_path).to eq(song_path(@song))
      expect(page).to have_content("Song was successfully updated")
    end

    scenario "delete a song", :js => true do
      visit songs_path
      page.evaluate_script('window.confirm = function() { return true; }')
      click_on("Delete")
      expect(current_path).to eq(songs_path)
      expect(page).to have_no_content(@song.title)
    end

  end

end
