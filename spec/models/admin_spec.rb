require 'spec_helper'

describe Admin do
 
  it "validates presence of email" do 
    admin = FactoryGirl.build(:admin, email: '')
    expect(admin.valid?).to eq(false)
  end
end