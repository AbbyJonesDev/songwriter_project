require 'spec_helper'

describe Article do
  let!(:article1) { FactoryGirl.create(:article, title: "Article 1") } 
  let!(:article2) { FactoryGirl.create(:article, title: "Article 2") } 
  let!(:article3) { FactoryGirl.create(:article, title: "Article 3") } 
  let!(:articles) { [article1, article2, article3] }

  it "sends array of articles" do
    expect(Article.article_list).to eq(articles)
  end
end
