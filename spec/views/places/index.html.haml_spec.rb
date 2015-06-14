require 'rails_helper'

RSpec.describe "places/index", type: :view do
  before(:each) do
    assign(:places, [
      Place.create!(
        :numero_cliente => "Numero Cliente",
        :nombre => "Nombre",
        :direccion => "direccion",
        :poblacion => "poblacion",
        :provincia => "Provincia",
        :dpostal => "Dpostal",
        :zona => "Zona",
        :telefono => "telefono",
        :fax => "Fax",
        :preguntar_por => "Preguntar Por",
        :reclamacion => "reclamacion",
        :actividad => "Actividad",
        :plaga => "Plaga",
        :area => "Area",
        :observaciones => "Observaciones",
        :plano => "Plano",
        :aplicador1 => "Aplicador1",
        :aplicador2 => "Aplicador2"
      ),
      Place.create!(
        :numero_cliente => "Numero Cliente",
        :nombre => "Nombre",
        :direccion => "direccion",
        :poblacion => "poblacion",
        :provincia => "Provincia",
        :dpostal => "Dpostal",
        :zona => "Zona",
        :telefono => "telefono",
        :fax => "Fax",
        :preguntar_por => "Preguntar Por",
        :reclamacion => "reclamacion",
        :actividad => "Actividad",
        :plaga => "Plaga",
        :area => "Area",
        :observaciones => "Observaciones",
        :plano => "Plano",
        :aplicador1 => "Aplicador1",
        :aplicador2 => "Aplicador2"
      )
    ])
  end

  it "renders a list of places" do
    render
    assert_select "tr>td", :text => "Numero Cliente".to_s, :count => 2
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "direccion".to_s, :count => 2
    assert_select "tr>td", :text => "poblacion".to_s, :count => 2
    assert_select "tr>td", :text => "Provincia".to_s, :count => 2
    assert_select "tr>td", :text => "Dpostal".to_s, :count => 2
    assert_select "tr>td", :text => "Zona".to_s, :count => 2
    assert_select "tr>td", :text => "telefono".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    assert_select "tr>td", :text => "Preguntar Por".to_s, :count => 2
    assert_select "tr>td", :text => "reclamacion".to_s, :count => 2
    assert_select "tr>td", :text => "Actividad".to_s, :count => 2
    assert_select "tr>td", :text => "Plaga".to_s, :count => 2
    assert_select "tr>td", :text => "Area".to_s, :count => 2
    assert_select "tr>td", :text => "Observaciones".to_s, :count => 2
    assert_select "tr>td", :text => "Plano".to_s, :count => 2
    assert_select "tr>td", :text => "Aplicador1".to_s, :count => 2
    assert_select "tr>td", :text => "Aplicador2".to_s, :count => 2
  end
end
