require 'rails_helper'

RSpec.describe "Plagues", type: :request do
  describe "GET /plagues" do
    it "works! (now write some real specs)" do
      get plagues_path
      expect(response).to have_http_status(200)
    end
  end
end
