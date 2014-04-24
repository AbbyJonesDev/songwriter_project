require 'spec_helper'

describe "articles/index" do
  before(:each) do
    assign(:articles, [
      stub_model(Article,
        :title => "Title",
        :content => "MyText",
        :admin_id => 1,
        :writer => "Writer",
        :keywords => "Keywords",
        :published => false
      ),
      stub_model(Article,
        :title => "Title",
        :content => "MyText",
        :admin_id => 1,
        :writer => "Writer",
        :keywords => "Keywords",
        :published => false
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Writer".to_s, :count => 2
    assert_select "tr>td", :text => "Keywords".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
