require 'rails_helper'

RSpec.describe "DefaultProducts", type: :request do
  describe "GET /default_products" do
    it "works! (now write some real specs)" do
      get default_products_path
      expect(response).to have_http_status(200)
    end
  end
end
