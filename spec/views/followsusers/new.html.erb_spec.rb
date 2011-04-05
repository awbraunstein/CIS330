require 'spec_helper'

describe "followsusers/new.html.erb" do
  before(:each) do
    assign(:followsuser, stub_model(Followsuser,
      :followerid => 1,
      :followingid => 1,
      :approved => 1
    ).as_new_record)
  end

  it "renders new followsuser form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => followsusers_path, :method => "post" do
      assert_select "input#followsuser_followerid", :name => "followsuser[followerid]"
      assert_select "input#followsuser_followingid", :name => "followsuser[followingid]"
      assert_select "input#followsuser_approved", :name => "followsuser[approved]"
    end
  end
end
