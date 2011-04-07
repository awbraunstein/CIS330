require 'spec_helper'

describe "followsusers/edit.html.erb" do
  before(:each) do
    @followsuser = assign(:followsuser, stub_model(Followsuser,
      :follower_id => 1,
      :following_id => 1,
      :approved => 1
    ))
  end

  it "renders the edit followsuser form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => followsusers_path(@followsuser), :method => "post" do
      assert_select "input#followsuser_follower_id", :name => "followsuser[follower_id]"
      assert_select "input#followsuser_following_id", :name => "followsuser[following_id]"
      assert_select "input#followsuser_approved", :name => "followsuser[approved]"
    end
  end
end
