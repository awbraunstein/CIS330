require 'spec_helper'

describe "messagerelations/show.html.erb" do
  before(:each) do
    @messagerelation = assign(:messagerelation, stub_model(Messagerelation,
      :from_id => 1,
      :to_id => 1,
      :read => false
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
