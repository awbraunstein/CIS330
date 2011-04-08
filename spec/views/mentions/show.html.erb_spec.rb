require 'spec_helper'

describe "mentions/show.html.erb" do
  before(:each) do
    @mention = assign(:mention, stub_model(Mention,
      :user_id => 1,
      :tweet_id => 1
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
