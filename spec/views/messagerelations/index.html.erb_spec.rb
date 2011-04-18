require 'spec_helper'

describe "messagerelations/index.html.erb" do
  before(:each) do
    assign(:messagerelations, [
      stub_model(Messagerelation,
        :message_id => 1,
        :from_id => 1,
        :to_id => 1,
        :read => false
      ),
      stub_model(Messagerelation,
        :message_id => 1,
        :from_id => 1,
        :to_id => 1,
        :read => false
      )
    ])
  end

  it "renders a list of messagerelations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
