require 'spec_helper'

describe "tagmentions/edit.html.erb" do
  before(:each) do
    @tagmention = assign(:tagmention, stub_model(Tagmention,
      :tweet_id => 1,
      :tag_id => 1
    ))
  end

  it "renders the edit tagmention form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tagmentions_path(@tagmention), :method => "post" do
      assert_select "input#tagmention_tweet_id", :name => "tagmention[tweet_id]"
      assert_select "input#tagmention_tag_id", :name => "tagmention[tag_id]"
    end
  end
end
