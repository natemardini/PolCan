require 'spec_helper'

describe "stories/edit.html.erb" do
  before(:each) do
    @story = assign(:story, stub_model(Story,
      :subject => "MyString",
      :body => "MyText",
      :category => 1,
      :member_id => 1
    ))
  end

  it "renders the edit story form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stories_path(@story), :method => "post" do
      assert_select "input#story_subject", :name => "story[subject]"
      assert_select "textarea#story_body", :name => "story[body]"
      assert_select "input#story_category", :name => "story[category]"
      assert_select "input#story_member_id", :name => "story[member_id]"
    end
  end
end
