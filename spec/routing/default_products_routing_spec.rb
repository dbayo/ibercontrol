require "rails_helper"

RSpec.describe DefaultProductsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/default_products").to route_to("default_products#index")
    end

    it "routes to #new" do
      expect(:get => "/default_products/new").to route_to("default_products#new")
    end

    it "routes to #show" do
      expect(:get => "/default_products/1").to route_to("default_products#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/default_products/1/edit").to route_to("default_products#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/default_products").to route_to("default_products#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/default_products/1").to route_to("default_products#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/default_products/1").to route_to("default_products#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/default_products/1").to route_to("default_products#destroy", :id => "1")
    end

  end
end
