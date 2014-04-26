require 'spec_helper'

describe "Articles" do
  describe "GET /articles" do
    it "works! (now write some real specs)" do
      get articles_path
      expect(response.status).to be(200)
    end
  end
end
