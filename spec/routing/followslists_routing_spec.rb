require "spec_helper"

describe FollowslistsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/followslists" }.should route_to(:controller => "followslists", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/followslists/new" }.should route_to(:controller => "followslists", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/followslists/1" }.should route_to(:controller => "followslists", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/followslists/1/edit" }.should route_to(:controller => "followslists", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/followslists" }.should route_to(:controller => "followslists", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/followslists/1" }.should route_to(:controller => "followslists", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/followslists/1" }.should route_to(:controller => "followslists", :action => "destroy", :id => "1")
    end

  end
end
