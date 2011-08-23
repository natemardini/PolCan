require 'spec_helper'

describe "stories/index.html.erb" do
  before(:each) do
    assign(:stories, [
      stub_model(Story,
        :subject => "Subject",
        :body => "MyText",
        :category => 1,
        :member_id => 1
      ),
      stub_model(Story,
        :subject => "Subject",
        :body => "MyText",
        :category => 1,
        :member_id => 1
      )
    ])
  end

  it "renders a list of stories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
