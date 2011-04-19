require 'spec_helper'

describe "favoritetweets/index.html.erb" do
  before(:each) do
    assign(:favoritetweets, [
      stub_model(Favoritetweet,
        :tweet_id => 1,
        :user_id => 1
      ),
      stub_model(Favoritetweet,
        :tweet_id => 1,
        :user_id => 1
      )
    ])
  end

  it "renders a list of favoritetweets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
