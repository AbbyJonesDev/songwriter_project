require 'spec_helper'

describe "articles/edit" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :title => "MyString",
      :content => "MyText",
      :admin_id => 1,
      :writer => "MyString",
      :keywords => "MyString",
      :published => false
    ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do
      assert_select "input#article_title[name=?]", "article[title]"
      assert_select "textarea#article_content[name=?]", "article[content]"
      assert_select "input#article_admin_id[name=?]", "article[admin_id]"
      assert_select "input#article_writer[name=?]", "article[writer]"
      assert_select "input#article_keywords[name=?]", "article[keywords]"
      assert_select "input#article_published[name=?]", "article[published]"
    end
  end
end
