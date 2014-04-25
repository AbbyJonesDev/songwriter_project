require 'spec_helper'

describe "Articles that rock" do

    
  context "As a site owner" do

    before :each do
      @admin = FactoryGirl.create(:admin)
      login_admin
    end

    it "lets me create new articles that rock" do
      visit admin_path
      click_on("Create New Article")
      fill_in_valid_article
      check("Publish")
      click_on("Create")
      expect(current_path).to eq(article_path(Article.find_by_title("This Article is Amazing")))
    end
  end


  context "As a visitor" do
  end




end

def fill_in_valid_article 
  fill_in("Title", with: "This Article is Amazing")
  fill_in("Content", with: "Here I describe how to rock")
  fill_in("Keywords", with: "rock, guitar")
end