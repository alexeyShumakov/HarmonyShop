require "rails_helper"

RSpec.describe SizeHelpersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/size_helpers").to route_to("size_helpers#index")
    end

    it "routes to #new" do
      expect(:get => "/size_helpers/new").to route_to("size_helpers#new")
    end

    it "routes to #show" do
      expect(:get => "/size_helpers/1").to route_to("size_helpers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/size_helpers/1/edit").to route_to("size_helpers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/size_helpers").to route_to("size_helpers#create")
    end

    it "routes to #update" do
      expect(:put => "/size_helpers/1").to route_to("size_helpers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/size_helpers/1").to route_to("size_helpers#destroy", :id => "1")
    end

  end
end
