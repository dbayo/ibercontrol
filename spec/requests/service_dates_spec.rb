require 'rails_helper'

RSpec.describe "ServiceDates", type: :request do
  describe "GET /service_dates" do
    it "works! (now write some real specs)" do
      get service_dates_path
      expect(response).to have_http_status(200)
    end
  end
end
