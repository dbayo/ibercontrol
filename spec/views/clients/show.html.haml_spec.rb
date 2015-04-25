require 'rails_helper'

RSpec.describe "clients/show", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      :nombre_fiscal => "Nombre Fiscal",
      :direccion_fiscal => "Direccion Fiscal",
      :poblacion_fiscal => "Poblacion Fiscal",
      :telefono_fiscal => "Telefono Fiscal",
      :codigo_postal => "Codigo Postal",
      :fax => "Fax",
      :preguntar_por => "Preguntar Por",
      :fecha_contrato => "Fecha Contrato",
      :cuota_contrato => "Cuota Contrato",
      :fecha_de_baja => "Fecha De Baja",
      :fecha_ultimo_aumento => "Fecha Ultimo Aumento",
      :cantidad_aumentada => "Cantidad Aumentada",
      :banco => "Banco",
      :agencia => "Agencia",
      :ccc => "Ccc",
      :nif => "Nif",
      :dia_de_factura => "Día De Factura",
      :dias_aplazado => "Días Aplazado",
      :iva => "Iva",
      :descuento => "Descuento",
      :observaciones => "Observaciones",
      :web => "Web",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre Fiscal/)
    expect(rendered).to match(/Direccion Fiscal/)
    expect(rendered).to match(/Poblacion Fiscal/)
    expect(rendered).to match(/Telefono Fiscal/)
    expect(rendered).to match(/Codigo Postal/)
    expect(rendered).to match(/Fax/)
    expect(rendered).to match(/Preguntar Por/)
    expect(rendered).to match(/Fecha Contrato/)
    expect(rendered).to match(/Cuota Contrato/)
    expect(rendered).to match(/Fecha De Baja/)
    expect(rendered).to match(/Fecha Ultimo Aumento/)
    expect(rendered).to match(/Cantidad Aumentada/)
    expect(rendered).to match(/Banco/)
    expect(rendered).to match(/Agencia/)
    expect(rendered).to match(/Ccc/)
    expect(rendered).to match(/Nif/)
    expect(rendered).to match(/Día De Factura/)
    expect(rendered).to match(/Días Aplazado/)
    expect(rendered).to match(/Iva/)
    expect(rendered).to match(/Descuento/)
    expect(rendered).to match(/Observaciones/)
    expect(rendered).to match(/Web/)
    expect(rendered).to match(/Email/)
  end
end
