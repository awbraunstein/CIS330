require 'spec_helper'

describe "messagerelations/new.html.erb" do
  before(:each) do
    assign(:messagerelation, stub_model(Messagerelation,
      :message_id => 1,
      :from_id => 1,
      :to_id => 1,
      :read => false
    ).as_new_record)
  end

  it "renders new messagerelation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messagerelations_path, :method => "post" do
      assert_select "input#messagerelation_message_id", :name => "messagerelation[message_id]"
      assert_select "input#messagerelation_from_id", :name => "messagerelation[from_id]"
      assert_select "input#messagerelation_to_id", :name => "messagerelation[to_id]"
      assert_select "input#messagerelation_read", :name => "messagerelation[read]"
    end
  end
end
