require "spec_helper"

describe MentionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/mentions" }.should route_to(:controller => "mentions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/mentions/new" }.should route_to(:controller => "mentions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/mentions/1" }.should route_to(:controller => "mentions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/mentions/1/edit" }.should route_to(:controller => "mentions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/mentions" }.should route_to(:controller => "mentions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/mentions/1" }.should route_to(:controller => "mentions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/mentions/1" }.should route_to(:controller => "mentions", :action => "destroy", :id => "1")
    end

  end
end
