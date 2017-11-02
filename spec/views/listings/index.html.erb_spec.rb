require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        :title => "Title",
        :description => "MyText",
        :owner => nil
      ),
      Listing.create!(
        :title => "Title",
        :description => "MyText",
        :owner => nil
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
