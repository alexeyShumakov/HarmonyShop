require "rails_helper"

RSpec.describe AdditionalDescriptionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/additional_descriptions").to route_to("additional_descriptions#index")
    end

    it "routes to #new" do
      expect(:get => "/additional_descriptions/new").to route_to("additional_descriptions#new")
    end

    it "routes to #show" do
      expect(:get => "/additional_descriptions/1").to route_to("additional_descriptions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/additional_descriptions/1/edit").to route_to("additional_descriptions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/additional_descriptions").to route_to("additional_descriptions#create")
    end

    it "routes to #update" do
      expect(:put => "/additional_descriptions/1").to route_to("additional_descriptions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/additional_descriptions/1").to route_to("additional_descriptions#destroy", :id => "1")
    end

  end
end
