require "rails_helper"

RSpec.describe ServiceDatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/service_dates").to route_to("service_dates#index")
    end

    it "routes to #new" do
      expect(:get => "/service_dates/new").to route_to("service_dates#new")
    end

    it "routes to #show" do
      expect(:get => "/service_dates/1").to route_to("service_dates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/service_dates/1/edit").to route_to("service_dates#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/service_dates").to route_to("service_dates#create")
    end

    it "routes to #update" do
      expect(:put => "/service_dates/1").to route_to("service_dates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/service_dates/1").to route_to("service_dates#destroy", :id => "1")
    end

  end
end
