require "rails_helper"

RSpec.describe ProductsColorsSizesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/products_colors_sizes").to route_to("products_colors_sizes#index")
    end

    it "routes to #new" do
      expect(:get => "/products_colors_sizes/new").to route_to("products_colors_sizes#new")
    end

    it "routes to #show" do
      expect(:get => "/products_colors_sizes/1").to route_to("products_colors_sizes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/products_colors_sizes/1/edit").to route_to("products_colors_sizes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/products_colors_sizes").to route_to("products_colors_sizes#create")
    end

    it "routes to #update" do
      expect(:put => "/products_colors_sizes/1").to route_to("products_colors_sizes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/products_colors_sizes/1").to route_to("products_colors_sizes#destroy", :id => "1")
    end

  end
end
