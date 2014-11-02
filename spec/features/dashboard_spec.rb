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
    it "doesn't let non-admin manage admin account details" do
      visit admin_account_path
      expect(current_path).to eq(new_admin_session_path) #For user to log in
    end

    it "doesn't let non-admin view dashboard" do
      visit admin_path
      expect(current_path).to eq(new_admin_session_path) #For user to log in
    end

    it "takes admin to dashboard after logging in" do
      login_admin
      expect(current_path).to eq(admin_path)
      expect(page).to have_selector('h1', text: "Dashboard")
    end
  end


  context "When logged in as admin" do
    before :each do
      login_admin
    end

    describe "Manage Account Details" do
      before :each do
        click_on("Manage Account Details")
        expect(current_path).to eq(admin_account_path)
      end

      it "Allows admin to change password" do
        fill_in("Current password", with: @admin.password)
        fill_in("Password", with: "newpassword")
        fill_in("Password confirmation", with: "newpassword")
        click_on("Update")
        @admin.reload  # Get updated record from database
        expect(page).to have_content"Account updated successfully"
        # expect(@admin.password).to eq("newpassword")
      end

      it "Allows admin to change email address" do
        fill_in("Email", with: "newaddress@email.com")
        fill_in("Current password", with: @admin.password)
        click_on("Update")
        @admin.reload  # Get updated record from database
        expect(page).to have_selector("div", text: "Account updated successfully")
        expect(@admin.email).to eq("newaddress@email.com")
      end

      it "Allows admin to change name" do
        fill_in("Name", with: "Admin Name")
        fill_in("Current password", with: @admin.password)
        click_on("Update")
        @admin.reload
        expect(page).to have_selector("div", text: "Account updated successfully")
        expect(@admin.name).to eq("Admin Name")
      end
    end

    describe "Manage Songs" do

      it "Shows a list of all songs" do
        songs = [ song1, song2, song3 ]
        songs.each do | song |
          expect(page).to have_content(song.title)
        end
      end

      it "Provides quick links to view a song" do
        click_on(Song.first.title)
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

    describe "Manage Articles" do
      it "Shows a list of all articles" do
        articles = [ article1, article2, article3 ]
        articles.each do | article |
          expect(page).to have_selector('td', text: article.title)
        end
      end

      it "Provides quick links to view an article" do
        within('table.manage_articles') do
          click_on(Article.first.title)
        end
        expect(current_path).to eq(article_path(article1))
      end

      it "Provides quick links to update an article" do
        within('table.manage_articles') do
          click_on("Edit", match: :first)
        end
        expect(current_path).to eq(edit_article_path(article1))
        fill_in("Content", with: "New, more awesome content")
        click_on("Update")
        expect(page).to have_selector("div", text: "Article was successfully updated.")
      end

      it "Provides quick links to delete an article", js: true do
        within('table.manage_articles') do
          expect do
            click_link('Delete', match: :first)
            page.evaluate_script('window.confirm = function() { return true; }')
          end.to change(Article, :count).by(-1)
        end
      end

      it "Makes adding a new article easy" do
        click_on("Create New Article")
        fill_in_valid_article
        check("Publish Now?")
        click_on("Create")
        expect(page).to have_selector('div', text: "Article was successfully created.")
      end
    end
  end
  
end


  