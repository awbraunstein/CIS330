require "spec_helper"

describe FollowsusersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/followsusers" }.should route_to(:controller => "followsusers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/followsusers/new" }.should route_to(:controller => "followsusers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/followsusers/1" }.should route_to(:controller => "followsusers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/followsusers/1/edit" }.should route_to(:controller => "followsusers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/followsusers" }.should route_to(:controller => "followsusers", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/followsusers/1" }.should route_to(:controller => "followsusers", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/followsusers/1" }.should route_to(:controller => "followsusers", :action => "destroy", :id => "1")
    end

  end
end
