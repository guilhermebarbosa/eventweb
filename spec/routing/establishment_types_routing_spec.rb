require "spec_helper"

describe EstablishmentTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/establishment_types").should route_to("establishment_types#index")
    end

    it "routes to #new" do
      get("/establishment_types/new").should route_to("establishment_types#new")
    end

    it "routes to #show" do
      get("/establishment_types/1").should route_to("establishment_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/establishment_types/1/edit").should route_to("establishment_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/establishment_types").should route_to("establishment_types#create")
    end

    it "routes to #update" do
      put("/establishment_types/1").should route_to("establishment_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/establishment_types/1").should route_to("establishment_types#destroy", :id => "1")
    end

  end
end
