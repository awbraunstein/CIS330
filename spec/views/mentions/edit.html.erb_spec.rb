require 'spec_helper'

describe "mentions/edit.html.erb" do
  before(:each) do
    @mention = assign(:mention, stub_model(Mention,
      :user_id => 1,
      :tweet_id => 1
    ))
  end

  it "renders the edit mention form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => mentions_path(@mention), :method => "post" do
      assert_select "input#mention_user_id", :name => "mention[user_id]"
      assert_select "input#mention_tweet_id", :name => "mention[tweet_id]"
    end
  end
end
