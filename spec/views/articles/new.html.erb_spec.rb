require 'spec_helper'

describe "articles/new" do
  before(:each) do
    assign(:article, stub_model(Article,
      :title => "MyString",
      :content => "MyText",
      :admin_id => 1,
      :writer => "MyString",
      :keywords => "MyString",
      :published => false
    ).as_new_record)
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do
      assert_select "input#article_title[name=?]", "article[title]"
      assert_select "textarea#article_content[name=?]", "article[content]"
      assert_select "input#article_admin_id[name=?]", "article[admin_id]"
      assert_select "input#article_writer[name=?]", "article[writer]"
      assert_select "input#article_keywords[name=?]", "article[keywords]"
      assert_select "input#article_published[name=?]", "article[published]"
    end
  end
end
