require "rails_helper"

RSpec.describe Admin::BgImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/bg_images").to route_to("admin/bg_images#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/bg_images/new").to route_to("admin/bg_images#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/bg_images/1").to route_to("admin/bg_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/bg_images/1/edit").to route_to("admin/bg_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/bg_images").to route_to("admin/bg_images#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/bg_images/1").to route_to("admin/bg_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/bg_images/1").to route_to("admin/bg_images#destroy", :id => "1")
    end

  end
end
