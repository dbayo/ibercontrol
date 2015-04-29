require 'rails_helper'

RSpec.describe "bills/index", type: :view do
  before(:each) do
    assign(:bills, [
      Bill.create!(
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
      ),
      Bill.create!(
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
      )
    ])
  end

  it "renders a list of bills" do
    render
    assert_select "tr>td", :text => "Numero Factura".to_s, :count => 2
    assert_select "tr>td", :text => "Estado".to_s, :count => 2
    assert_select "tr>td", :text => "Fecha Factura".to_s, :count => 2
    assert_select "tr>td", :text => "Year".to_s, :count => 2
    assert_select "tr>td", :text => "Nif".to_s, :count => 2
    assert_select "tr>td", :text => "Nombre Fis".to_s, :count => 2
    assert_select "tr>td", :text => "Direccion Fis".to_s, :count => 2
    assert_select "tr>td", :text => "Poblacion Fis".to_s, :count => 2
    assert_select "tr>td", :text => "Provincia Fis".to_s, :count => 2
    assert_select "tr>td", :text => "Dpostal Fis".to_s, :count => 2
    assert_select "tr>td", :text => "Periodo Desde".to_s, :count => 2
    assert_select "tr>td", :text => "Periodo Hasta".to_s, :count => 2
    assert_select "tr>td", :text => "Tipo Servicio".to_s, :count => 2
    assert_select "tr>td", :text => "Nombre Apl".to_s, :count => 2
    assert_select "tr>td", :text => "Direccion Apl".to_s, :count => 2
    assert_select "tr>td", :text => "Poblacion Apl".to_s, :count => 2
    assert_select "tr>td", :text => "Provincia Apl".to_s, :count => 2
    assert_select "tr>td", :text => "Dpostal Apl".to_s, :count => 2
    assert_select "tr>td", :text => "Base Imponible".to_s, :count => 2
    assert_select "tr>td", :text => "Base Impuestos Sin Descuentos".to_s, :count => 2
    assert_select "tr>td", :text => "Descuento".to_s, :count => 2
    assert_select "tr>td", :text => "Total Descuento".to_s, :count => 2
    assert_select "tr>td", :text => "Iva".to_s, :count => 2
    assert_select "tr>td", :text => "Total Iva".to_s, :count => 2
    assert_select "tr>td", :text => "Total Factura".to_s, :count => 2
    assert_select "tr>td", :text => "Numero Recibo".to_s, :count => 2
    assert_select "tr>td", :text => "Fecha Vencimiento".to_s, :count => 2
    assert_select "tr>td", :text => "Banco".to_s, :count => 2
    assert_select "tr>td", :text => "Agencia".to_s, :count => 2
    assert_select "tr>td", :text => "Ccc".to_s, :count => 2
    assert_select "tr>td", :text => "Observaciones".to_s, :count => 2
    assert_select "tr>td", :text => "Cobrada".to_s, :count => 2
    assert_select "tr>td", :text => "Fecha Cobrada".to_s, :count => 2
    assert_select "tr>td", :text => "Abonada".to_s, :count => 2
    assert_select "tr>td", :text => "Morosa".to_s, :count => 2
    assert_select "tr>td", :text => "Extras".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
