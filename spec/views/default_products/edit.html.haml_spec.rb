require 'rails_helper'

RSpec.describe "default_products/edit", type: :view do
  before(:each) do
    @default_product = assign(:default_product, DefaultProduct.create!(
      :name => ""
    ))
  end

  it "renders the edit default_product form" do
    render

    assert_select "form[action=?][method=?]", default_product_path(@default_product), "post" do

      assert_select "input#default_product_name[name=?]", "default_product[name]"
    end
  end
end
