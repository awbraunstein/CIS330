require 'spec_helper'

describe "inlists/show.html.erb" do
  before(:each) do
    @inlist = assign(:inlist, stub_model(Inlist,
      :list_id => 1,
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
