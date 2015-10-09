require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :producto => "",
      :numero_registro => "",
      :material_activo => "",
      :disolucion => "",
      :tecnica => "",
      :plazo_seguridad => "",
      :extras => ""
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_producto[name=?]", "product[producto]"

      assert_select "input#product_numero_registro[name=?]", "product[numero_registro]"

      assert_select "input#product_material_activo[name=?]", "product[material_activo]"

      assert_select "input#product_disolucion[name=?]", "product[disolucion]"

      assert_select "input#product_tecnica[name=?]", "product[tecnica]"

      assert_select "input#product_plazo_seguridad[name=?]", "product[plazo_seguridad]"

      assert_select "input#product_extras[name=?]", "product[extras]"
    end
  end
end
