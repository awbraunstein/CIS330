require 'spec_helper'

describe "followsusers/show.html.erb" do
  before(:each) do
    @followsuser = assign(:followsuser, stub_model(Followsuser,
      :follower_id => 1,
      :following_id => 1,
      :approved => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
