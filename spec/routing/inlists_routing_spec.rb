require "spec_helper"

describe InlistsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/inlists" }.should route_to(:controller => "inlists", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/inlists/new" }.should route_to(:controller => "inlists", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/inlists/1" }.should route_to(:controller => "inlists", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/inlists/1/edit" }.should route_to(:controller => "inlists", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/inlists" }.should route_to(:controller => "inlists", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/inlists/1" }.should route_to(:controller => "inlists", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/inlists/1" }.should route_to(:controller => "inlists", :action => "destroy", :id => "1")
    end

  end
end
