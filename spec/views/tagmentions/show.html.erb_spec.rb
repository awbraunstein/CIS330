require 'spec_helper'

describe "tagmentions/show.html.erb" do
  before(:each) do
    @tagmention = assign(:tagmention, stub_model(Tagmention,
      :tweet_id => 1,
      :tag_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
