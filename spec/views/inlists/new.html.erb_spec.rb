require 'spec_helper'

describe "inlists/new.html.erb" do
  before(:each) do
    assign(:inlist, stub_model(Inlist,
      :list_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new inlist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => inlists_path, :method => "post" do
      assert_select "input#inlist_list_id", :name => "inlist[list_id]"
      assert_select "input#inlist_user_id", :name => "inlist[user_id]"
    end
  end
end
