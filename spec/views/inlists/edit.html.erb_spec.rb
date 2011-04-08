require 'spec_helper'

describe "inlists/edit.html.erb" do
  before(:each) do
    @inlist = assign(:inlist, stub_model(Inlist,
      :list_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit inlist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => inlists_path(@inlist), :method => "post" do
      assert_select "input#inlist_list_id", :name => "inlist[list_id]"
      assert_select "input#inlist_user_id", :name => "inlist[user_id]"
    end
  end
end
