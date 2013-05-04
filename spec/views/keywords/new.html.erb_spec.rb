require 'spec_helper'

describe "keywords/new" do
  before(:each) do
    assign(:keyword, stub_model(Keyword,
      :content => "MyString",
      :munged_content => "MyString",
      :project => nil
    ).as_new_record)
  end

  it "renders new keyword form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", keywords_path, "post" do
      assert_select "input#keyword_content[name=?]", "keyword[content]"
      assert_select "input#keyword_munged_content[name=?]", "keyword[munged_content]"
      assert_select "input#keyword_project[name=?]", "keyword[project]"
    end
  end
end
