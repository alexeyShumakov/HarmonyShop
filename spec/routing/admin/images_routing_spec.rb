require "rails_helper"

RSpec.describe Admin::ImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/images").to route_to("admin/images#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/images/new").to route_to("admin/images#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/images/1").to route_to("admin/images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/images/1/edit").to route_to("admin/images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/images").to route_to("admin/images#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/images/1").to route_to("admin/images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/images/1").to route_to("admin/images#destroy", :id => "1")
    end

  end
end
