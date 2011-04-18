require 'spec_helper'

describe "messagerelations/edit.html.erb" do
  before(:each) do
    @messagerelation = assign(:messagerelation, stub_model(Messagerelation,
      :from_id => 1,
      :to_id => 1,
      :read => false
    ))
  end

  it "renders the edit messagerelation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messagerelations_path(@messagerelation), :method => "post" do
      assert_select "input#messagerelation_from_id", :name => "messagerelation[from_id]"
      assert_select "input#messagerelation_to_id", :name => "messagerelation[to_id]"
      assert_select "input#messagerelation_read", :name => "messagerelation[read]"
    end
  end
end
