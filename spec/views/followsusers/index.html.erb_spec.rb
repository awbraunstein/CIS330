require 'spec_helper'

describe "followsusers/index.html.erb" do
  before(:each) do
    assign(:followsusers, [
      stub_model(Followsuser,
        :follower_id => 1,
        :following_id => 1,
        :approved => false
      ),
      stub_model(Followsuser,
        :follower_id => 1,
        :following_id => 1,
        :approved => false
      )
    ])
  end

  it "renders a list of followsusers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
