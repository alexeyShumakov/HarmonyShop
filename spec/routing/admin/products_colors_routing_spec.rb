require "rails_helper"

RSpec.describe Admin::ProductsColorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/products_colors").to route_to("admin/products_colors#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/products_colors/new").to route_to("admin/products_colors#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/products_colors/1").to route_to("admin/products_colors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/products_colors/1/edit").to route_to("admin/products_colors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/products_colors").to route_to("admin/products_colors#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/products_colors/1").to route_to("admin/products_colors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/products_colors/1").to route_to("admin/products_colors#destroy", :id => "1")
    end

  end
end
