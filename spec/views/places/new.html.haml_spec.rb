require 'rails_helper'

RSpec.describe "places/new", type: :view do
  before(:each) do
    assign(:place, Place.new(
      :numero_cliente => "MyString",
      :numero_de_orden => "MyString",
      :nombre => "MyString",
      :dirección => "MyString",
      :población => "MyString",
      :provincia => "MyString",
      :dpostal => "MyString",
      :zona => "MyString",
      :teléfono => "MyString",
      :fax => "MyString",
      :preguntar_por => "MyString",
      :reclamación => "MyString",
      :actividad => "MyString",
      :plaga => "MyString",
      :area => "MyString",
      :observaciones => "MyString",
      :plano => "MyString",
      :aplicador1 => "MyString",
      :aplicador2 => "MyString"
    ))
  end

  it "renders new place form" do
    render

    assert_select "form[action=?][method=?]", places_path, "post" do

      assert_select "input#place_numero_cliente[name=?]", "place[numero_cliente]"

      assert_select "input#place_numero_de_orden[name=?]", "place[numero_de_orden]"

      assert_select "input#place_nombre[name=?]", "place[nombre]"

      assert_select "input#place_dirección[name=?]", "place[dirección]"

      assert_select "input#place_población[name=?]", "place[población]"

      assert_select "input#place_provincia[name=?]", "place[provincia]"

      assert_select "input#place_dpostal[name=?]", "place[dpostal]"

      assert_select "input#place_zona[name=?]", "place[zona]"

      assert_select "input#place_teléfono[name=?]", "place[teléfono]"

      assert_select "input#place_fax[name=?]", "place[fax]"

      assert_select "input#place_preguntar_por[name=?]", "place[preguntar_por]"

      assert_select "input#place_reclamación[name=?]", "place[reclamación]"

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
