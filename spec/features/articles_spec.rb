require 'spec_helper'

feature "Articles that rock" do

  let!(:article1) { FactoryGirl.create(:article, title: "Article 1") }
  let!(:article2) { FactoryGirl.create(:article, title: "Article 2") }
  let!(:article3) { FactoryGirl.create(:article, title: "Article 3") }


  context "visitor is not an admin" do
    
    scenario "article pages have no new link" do
      visit articles_path
      expect(page).to have_no_link('New')

      visit article_path(article1)
      expect(page).to have_no_link('New')
    end

    scenario "visitor attempts to visit new_article_path" do
      visit new_article_path
      expect(current_path).to eq(new_admin_session_path)
    end

    scenario "article pages have no edit link" do
      visit articles_path
      expect(page).to have_no_link("Edit")

      visit article_path(article1)
      expect(page).to have_no_link('Edit')
    end

    scenario "visitor attempts to visit edit_article_path" do
      visit edit_article_path(article1)
      expect(current_path).to eq(new_admin_session_path)
    end

  end


  context "admin is logged in" do
    before :each do
      @admin = FactoryGirl.create(:admin)
      login_admin
    end

    scenario "add a new article" do
      visit new_article_path
      fill_in_valid_article
      click_on("Create Article")
      expect(page).to have_content("Article was successfully created")
    end

    scenario "update an article" do
      visit edit_article_path(article1)
      fill_in("Title", with: "New Title for Article")
      click_on("Update Article")
      expect(current_path).to eq(article_path(article1))
      expect(page).to have_content("Article was successfully updated")
    end

    scenario "delete an article", :js => true do
      visit articles_path
      page.evaluate_script('window.confirm = function() { return true; }')
      click_on("Delete", match: :first)
      expect(current_path).to eq(articles_path)
      expect(page).to have_no_content(article1.title)
    end
  end


end
