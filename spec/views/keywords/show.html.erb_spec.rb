require 'spec_helper'

describe "keywords/show" do
  before(:each) do
    @keyword = assign(:keyword, stub_model(Keyword,
      :content => "Content",
      :munged_content => "Munged Content",
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content/)
    rendered.should match(/Munged Content/)
    rendered.should match(//)
  end
end
