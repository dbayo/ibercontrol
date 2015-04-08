require 'rails_helper'

RSpec.describe "places/show", type: :view do
  before(:each) do
    @place = assign(:place, Place.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Numero Cliente/)
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/direccion/)
    expect(rendered).to match(/poblacion/)
    expect(rendered).to match(/Provincia/)
    expect(rendered).to match(/Dpostal/)
    expect(rendered).to match(/Zona/)
    expect(rendered).to match(/telefono/)
    expect(rendered).to match(/Fax/)
    expect(rendered).to match(/Preguntar Por/)
    expect(rendered).to match(/reclamacion/)
    expect(rendered).to match(/Actividad/)
    expect(rendered).to match(/Plaga/)
    expect(rendered).to match(/Area/)
    expect(rendered).to match(/Observaciones/)
    expect(rendered).to match(/Plano/)
    expect(rendered).to match(/Aplicador1/)
    expect(rendered).to match(/Aplicador2/)
  end
end
