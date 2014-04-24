require 'spec_helper'

describe "articles/show" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :title => "Title",
      :content => "MyText",
      :admin_id => 1,
      :writer => "Writer",
      :keywords => "Keywords",
      :published => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Writer/)
    expect(rendered).to match(/Keywords/)
    expect(rendered).to match(/false/)
  end
end
