require 'spec_helper'

describe "favoritetweets/edit.html.erb" do
  before(:each) do
    @favoritetweet = assign(:favoritetweet, stub_model(Favoritetweet,
      :tweet_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit favoritetweet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => favoritetweets_path(@favoritetweet), :method => "post" do
      assert_select "input#favoritetweet_tweet_id", :name => "favoritetweet[tweet_id]"
      assert_select "input#favoritetweet_user_id", :name => "favoritetweet[user_id]"
    end
  end
end
