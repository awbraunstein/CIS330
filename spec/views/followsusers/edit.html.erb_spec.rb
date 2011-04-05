require 'spec_helper'

describe "followsusers/edit.html.erb" do
  before(:each) do
    @followsuser = assign(:followsuser, stub_model(Followsuser,
      :followerid => 1,
      :followingid => 1,
      :approved => 1
    ))
  end

  it "renders the edit followsuser form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => followsusers_path(@followsuser), :method => "post" do
      assert_select "input#followsuser_followerid", :name => "followsuser[followerid]"
      assert_select "input#followsuser_followingid", :name => "followsuser[followingid]"
      assert_select "input#followsuser_approved", :name => "followsuser[approved]"
    end
  end
end
