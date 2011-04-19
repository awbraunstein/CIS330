require "spec_helper"

describe FavoritetweetsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/favoritetweets" }.should route_to(:controller => "favoritetweets", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/favoritetweets/new" }.should route_to(:controller => "favoritetweets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/favoritetweets/1" }.should route_to(:controller => "favoritetweets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/favoritetweets/1/edit" }.should route_to(:controller => "favoritetweets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/favoritetweets" }.should route_to(:controller => "favoritetweets", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/favoritetweets/1" }.should route_to(:controller => "favoritetweets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/favoritetweets/1" }.should route_to(:controller => "favoritetweets", :action => "destroy", :id => "1")
    end

  end
end
