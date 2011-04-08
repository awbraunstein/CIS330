require 'spec_helper'

describe "followslists/edit.html.erb" do
  before(:each) do
    @followslist = assign(:followslist, stub_model(Followslist,
      :list_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit followslist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => followslists_path(@followslist), :method => "post" do
      assert_select "input#followslist_list_id", :name => "followslist[list_id]"
      assert_select "input#followslist_user_id", :name => "followslist[user_id]"
    end
  end
end
