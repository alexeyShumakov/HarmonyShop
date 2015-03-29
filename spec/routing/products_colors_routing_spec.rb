require "rails_helper"

RSpec.describe ProductsColorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/products_colors").to route_to("products_colors#index")
    end

    it "routes to #new" do
      expect(:get => "/products_colors/new").to route_to("products_colors#new")
    end

    it "routes to #show" do
      expect(:get => "/products_colors/1").to route_to("products_colors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/products_colors/1/edit").to route_to("products_colors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/products_colors").to route_to("products_colors#create")
    end

    it "routes to #update" do
      expect(:put => "/products_colors/1").to route_to("products_colors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/products_colors/1").to route_to("products_colors#destroy", :id => "1")
    end

  end
end
