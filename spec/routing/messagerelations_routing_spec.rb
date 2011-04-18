require "spec_helper"

describe MessagerelationsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/messagerelations" }.should route_to(:controller => "messagerelations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/messagerelations/new" }.should route_to(:controller => "messagerelations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/messagerelations/1" }.should route_to(:controller => "messagerelations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/messagerelations/1/edit" }.should route_to(:controller => "messagerelations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/messagerelations" }.should route_to(:controller => "messagerelations", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/messagerelations/1" }.should route_to(:controller => "messagerelations", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/messagerelations/1" }.should route_to(:controller => "messagerelations", :action => "destroy", :id => "1")
    end

  end
end
