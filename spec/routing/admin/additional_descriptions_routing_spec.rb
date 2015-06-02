require "rails_helper"

RSpec.describe Admin::AdditionalDescriptionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/additional_descriptions").to route_to("admin/additional_descriptions#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/additional_descriptions/new").to route_to("admin/additional_descriptions#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/additional_descriptions/1").to route_to("admin/additional_descriptions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/additional_descriptions/1/edit").to route_to("admin/additional_descriptions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/additional_descriptions").to route_to("admin/additional_descriptions#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/additional_descriptions/1").to route_to("admin/additional_descriptions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/additional_descriptions/1").to route_to("admin/additional_descriptions#destroy", :id => "1")
    end

  end
end
