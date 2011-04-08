require "spec_helper"

describe TagmentionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/tagmentions" }.should route_to(:controller => "tagmentions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tagmentions/new" }.should route_to(:controller => "tagmentions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tagmentions/1" }.should route_to(:controller => "tagmentions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tagmentions/1/edit" }.should route_to(:controller => "tagmentions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tagmentions" }.should route_to(:controller => "tagmentions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/tagmentions/1" }.should route_to(:controller => "tagmentions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tagmentions/1" }.should route_to(:controller => "tagmentions", :action => "destroy", :id => "1")
    end

  end
end
