require 'spec_helper'

describe "followslists/new.html.erb" do
  before(:each) do
    assign(:followslist, stub_model(Followslist,
      :list_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new followslist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => followslists_path, :method => "post" do
      assert_select "input#followslist_list_id", :name => "followslist[list_id]"
      assert_select "input#followslist_user_id", :name => "followslist[user_id]"
    end
  end
end
