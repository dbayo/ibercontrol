require 'rails_helper'

RSpec.describe "bills/show", type: :view do
  before(:each) do
    @bill = assign(:bill, Bill.create!(
      :numero_factura => "Numero Factura",
      :estado => "Estado",
      :fecha_factura => "Fecha Factura",
      :year => "Year",
      :nif => "Nif",
      :nombre_fis => "Nombre Fis",
      :direccion_fis => "Direccion Fis",
      :poblacion_fis => "Poblacion Fis",
      :provincia_fis => "Provincia Fis",
      :dpostal_fis => "Dpostal Fis",
      :periodo_desde => "Periodo Desde",
      :periodo_hasta => "Periodo Hasta",
      :tipo_servicio => "Tipo Servicio",
      :nombre_apl => "Nombre Apl",
      :direccion_apl => "Direccion Apl",
      :poblacion_apl => "Poblacion Apl",
      :provincia_apl => "Provincia Apl",
      :dpostal_apl => "Dpostal Apl",
      :base_imponible => "Base Imponible",
      :base_impuestos_sin_descuentos => "Base Impuestos Sin Descuentos",
      :descuento => "Descuento",
      :total_descuento => "Total Descuento",
      :iva => "Iva",
      :total_iva => "Total Iva",
      :total_factura => "Total Factura",
      :numero_recibo => "Numero Recibo",
      :fecha_vencimiento => "Fecha Vencimiento",
      :banco => "Banco",
      :agencia => "Agencia",
      :ccc => "Ccc",
      :observaciones => "Observaciones",
      :cobrada => "Cobrada",
      :fecha_cobrada => "Fecha Cobrada",
      :abonada => "Abonada",
      :morosa => "Morosa",
      :extras => "Extras",
      :client => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Numero Factura/)
    expect(rendered).to match(/Estado/)
    expect(rendered).to match(/Fecha Factura/)
    expect(rendered).to match(/Year/)
    expect(rendered).to match(/Nif/)
    expect(rendered).to match(/Nombre Fis/)
    expect(rendered).to match(/Direccion Fis/)
    expect(rendered).to match(/Poblacion Fis/)
    expect(rendered).to match(/Provincia Fis/)
    expect(rendered).to match(/Dpostal Fis/)
    expect(rendered).to match(/Periodo Desde/)
    expect(rendered).to match(/Periodo Hasta/)
    expect(rendered).to match(/Tipo Servicio/)
    expect(rendered).to match(/Nombre Apl/)
    expect(rendered).to match(/Direccion Apl/)
    expect(rendered).to match(/Poblacion Apl/)
    expect(rendered).to match(/Provincia Apl/)
    expect(rendered).to match(/Dpostal Apl/)
    expect(rendered).to match(/Base Imponible/)
    expect(rendered).to match(/Base Impuestos Sin Descuentos/)
    expect(rendered).to match(/Descuento/)
    expect(rendered).to match(/Total Descuento/)
    expect(rendered).to match(/Iva/)
    expect(rendered).to match(/Total Iva/)
    expect(rendered).to match(/Total Factura/)
    expect(rendered).to match(/Numero Recibo/)
    expect(rendered).to match(/Fecha Vencimiento/)
    expect(rendered).to match(/Banco/)
    expect(rendered).to match(/Agencia/)
    expect(rendered).to match(/Ccc/)
    expect(rendered).to match(/Observaciones/)
    expect(rendered).to match(/Cobrada/)
    expect(rendered).to match(/Fecha Cobrada/)
    expect(rendered).to match(/Abonada/)
    expect(rendered).to match(/Morosa/)
    expect(rendered).to match(/Extras/)
    expect(rendered).to match(//)
  end
end
