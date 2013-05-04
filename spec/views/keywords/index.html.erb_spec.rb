require 'spec_helper'

describe "keywords/index" do
  before(:each) do
    assign(:keywords, [
      stub_model(Keyword,
        :content => "Content",
        :munged_content => "Munged Content",
        :project => nil
      ),
      stub_model(Keyword,
        :content => "Content",
        :munged_content => "Munged Content",
        :project => nil
      )
    ])
  end

  it "renders a list of keywords" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Munged Content".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
