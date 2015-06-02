require "rails_helper"

RSpec.describe Admin::ServicesGroupsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/services_groups").to route_to("admin/services_groups#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/services_groups/new").to route_to("admin/services_groups#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/services_groups/1").to route_to("admin/services_groups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/services_groups/1/edit").to route_to("admin/services_groups#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/services_groups").to route_to("admin/services_groups#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/services_groups/1").to route_to("admin/services_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/services_groups/1").to route_to("admin/services_groups#destroy", :id => "1")
    end

  end
end
