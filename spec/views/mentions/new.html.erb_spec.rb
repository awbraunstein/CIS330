require 'spec_helper'

describe "mentions/new.html.erb" do
  before(:each) do
    assign(:mention, stub_model(Mention,
      :user_id => 1,
      :tweet_id => 1
    ).as_new_record)
  end

  it "renders new mention form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => mentions_path, :method => "post" do
      assert_select "input#mention_user_id", :name => "mention[user_id]"
      assert_select "input#mention_tweet_id", :name => "mention[tweet_id]"
    end
  end
end
