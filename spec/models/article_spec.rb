require 'spec_helper'

describe Article do
  let!(:article1) { FactoryGirl.create(:article, title: "Article 1") } 
  let!(:article2) { FactoryGirl.create(:article, title: "Article 2") } 
  let!(:article3) { FactoryGirl.create(:article, title: "Article 3") } 
  let!(:articles) { [article1, article2, article3] }

  it "is invalid without a title" do
    untitled = Article.new(title: '')
    expect(untitled.valid?).to be(false)
  end

  it "must have a unique title" do
    duplicate = Article.new(title: article1.title)
    expect(duplicate.valid?).to be(false)
  end

  it "belongs to an admin" do
    expect(article1.admin).to be_instance_of(Admin)
  end

  it "sends array of articles" do
    expect(Article.article_list).to eq(articles)
  end
end
