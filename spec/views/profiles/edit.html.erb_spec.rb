require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :user_name => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :image_data => "MyText",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input[name=?]", "profile[user_name]"

      assert_select "input[name=?]", "profile[first_name]"

      assert_select "input[name=?]", "profile[last_name]"

      assert_select "textarea[name=?]", "profile[image_data]"

      assert_select "textarea[name=?]", "profile[description]"

      assert_select "input[name=?]", "profile[user_id]"
    end
  end
end
