require 'spec_helper'

describe "messages/new.html.erb" do
  before(:each) do
    assign(:message, stub_model(Message,
      :subject => "MyString",
      :body => "MyText",
      :from => "",
      :to => ""
    ).as_new_record)
  end

  it "renders new message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path, :method => "post" do
      assert_select "input#message_subject", :name => "message[subject]"
      assert_select "textarea#message_body", :name => "message[body]"
      assert_select "input#message_from", :name => "message[from]"
      assert_select "input#message_to", :name => "message[to]"
    end
  end
end
