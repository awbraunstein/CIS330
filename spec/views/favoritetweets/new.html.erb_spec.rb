require 'spec_helper'

describe "favoritetweets/new.html.erb" do
  before(:each) do
    assign(:favoritetweet, stub_model(Favoritetweet,
      :tweet_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new favoritetweet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => favoritetweets_path, :method => "post" do
      assert_select "input#favoritetweet_tweet_id", :name => "favoritetweet[tweet_id]"
      assert_select "input#favoritetweet_user_id", :name => "favoritetweet[user_id]"
    end
  end
end
