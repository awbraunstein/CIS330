require 'spec_helper'

describe "followsusers/show.html.erb" do
  before(:each) do
    @followsuser = assign(:followsuser, stub_model(Followsuser,
      :followerid => 1,
      :followingid => 1,
      :approved => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
