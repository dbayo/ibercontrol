require 'rails_helper'

RSpec.describe "default_products/new", type: :view do
  before(:each) do
    assign(:default_product, DefaultProduct.new(
      :name => ""
    ))
  end

  it "renders new default_product form" do
    render

    assert_select "form[action=?][method=?]", default_products_path, "post" do

      assert_select "input#default_product_name[name=?]", "default_product[name]"
    end
  end
end
