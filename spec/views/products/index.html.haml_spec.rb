require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :producto => "",
        :numero_registro => "",
        :material_activo => "",
        :disolucion => "",
        :tecnica => "",
        :plazo_seguridad => "",
        :extras => ""
      ),
      Product.create!(
        :producto => "",
        :numero_registro => "",
        :material_activo => "",
        :disolucion => "",
        :tecnica => "",
        :plazo_seguridad => "",
        :extras => ""
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
