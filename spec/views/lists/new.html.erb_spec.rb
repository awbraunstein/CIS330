require 'spec_helper'

describe "lists/new.html.erb" do
  before(:each) do
    assign(:list, stub_model(List,
      :name => "MyString",
      :private => false,
      :creator_id => 1
    ).as_new_record)
  end

  it "renders new list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lists_path, :method => "post" do
      assert_select "input#list_name", :name => "list[name]"
      assert_select "input#list_private", :name => "list[private]"
      assert_select "input#list_creator_id", :name => "list[creator_id]"
    end
  end
end
