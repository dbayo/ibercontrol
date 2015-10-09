require "rails_helper"

RSpec.describe PlaguesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/plagues").to route_to("plagues#index")
    end

    it "routes to #new" do
      expect(:get => "/plagues/new").to route_to("plagues#new")
    end

    it "routes to #show" do
      expect(:get => "/plagues/1").to route_to("plagues#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/plagues/1/edit").to route_to("plagues#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/plagues").to route_to("plagues#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/plagues/1").to route_to("plagues#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/plagues/1").to route_to("plagues#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/plagues/1").to route_to("plagues#destroy", :id => "1")
    end

  end
end
