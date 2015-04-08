require 'rails_helper'

RSpec.describe "places/edit", type: :view do
  before(:each) do
    @place = assign(:place, Place.create!(
      :numero_cliente => "MyString",
      :nombre => "MyString",
      :direccion => "MyString",
      :poblacion => "MyString",
      :provincia => "MyString",
      :dpostal => "MyString",
      :zona => "MyString",
      :telefono => "MyString",
      :fax => "MyString",
      :preguntar_por => "MyString",
      :reclamacion => "MyString",
      :actividad => "MyString",
      :plaga => "MyString",
      :area => "MyString",
      :observaciones => "MyString",
      :plano => "MyString",
      :aplicador1 => "MyString",
      :aplicador2 => "MyString"
    ))
  end

  it "renders the edit place form" do
    render

    assert_select "form[action=?][method=?]", place_path(@place), "post" do

      assert_select "input#place_numero_cliente[name=?]", "place[numero_cliente]"

      assert_select "input#place_nombre[name=?]", "place[nombre]"

      assert_select "input#place_direccion[name=?]", "place[direccion]"

      assert_select "input#place_poblacion[name=?]", "place[poblacion]"

      assert_select "input#place_provincia[name=?]", "place[provincia]"

      assert_select "input#place_dpostal[name=?]", "place[dpostal]"

      assert_select "input#place_zona[name=?]", "place[zona]"

      assert_select "input#place_telefono[name=?]", "place[telefono]"

      assert_select "input#place_fax[name=?]", "place[fax]"

      assert_select "input#place_preguntar_por[name=?]", "place[preguntar_por]"

      assert_select "input#place_reclamacion[name=?]", "place[reclamacion]"

      assert_select "input#place_actividad[name=?]", "place[actividad]"

      assert_select "input#place_plaga[name=?]", "place[plaga]"

      assert_select "input#place_area[name=?]", "place[area]"

      assert_select "input#place_observaciones[name=?]", "place[observaciones]"

      assert_select "input#place_plano[name=?]", "place[plano]"

      assert_select "input#place_aplicador1[name=?]", "place[aplicador1]"

      assert_select "input#place_aplicador2[name=?]", "place[aplicador2]"
    end
  end
end
