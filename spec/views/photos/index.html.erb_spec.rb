require 'rails_helper'

RSpec.describe "photos/index", type: :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(
        :listing => nil,
        :image_data => "Image Data"
      ),
      Photo.create!(
        :listing => nil,
        :image_data => "Image Data"
      )
    ])
  end

  it "renders a list of photos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Image Data".to_s, :count => 2
  end
end
