require "rails_helper"

RSpec.describe Admin::SizesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/sizes").to route_to("admin/sizes#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/sizes/new").to route_to("admin/sizes#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/sizes/1").to route_to("admin/sizes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/sizes/1/edit").to route_to("admin/sizes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/sizes").to route_to("admin/sizes#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/sizes/1").to route_to("admin/sizes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/sizes/1").to route_to("admin/sizes#destroy", :id => "1")
    end

  end
end
