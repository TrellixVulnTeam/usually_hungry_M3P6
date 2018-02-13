require 'rails_helper'

RSpec.describe "list_items/edit", type: :view do
  before(:each) do
    @list_item = assign(:list_item, ListItem.create!(
      :list_id => 1,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit list_item form" do
    render

    assert_select "form[action=?][method=?]", list_item_path(@list_item), "post" do

      assert_select "input[name=?]", "list_item[list_id]"

      assert_select "input[name=?]", "list_item[name]"

      assert_select "textarea[name=?]", "list_item[description]"
    end
  end
end
