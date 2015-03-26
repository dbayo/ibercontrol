require 'rails_helper'

RSpec.describe "clients/index", type: :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
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
        :día_de_factura => "Día De Factura",
        :días_aplazado => "Días Aplazado",
        :iva => "Iva",
        :descuento => "Descuento",
        :tipo_de_servicio => "Tipo De Servicio",
        :observaciones => "Observaciones",
        :web => "Web",
        :email => "Email"
      ),
      Client.create!(
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
        :día_de_factura => "Día De Factura",
        :días_aplazado => "Días Aplazado",
        :iva => "Iva",
        :descuento => "Descuento",
        :tipo_de_servicio => "Tipo De Servicio",
        :observaciones => "Observaciones",
        :web => "Web",
        :email => "Email"
      )
    ])
  end

  it "renders a list of clients" do
    render
    assert_select "tr>td", :text => "Nombre Fiscal".to_s, :count => 2
    assert_select "tr>td", :text => "Direccion Fiscal".to_s, :count => 2
    assert_select "tr>td", :text => "Poblacion Fiscal".to_s, :count => 2
    assert_select "tr>td", :text => "Telefono Fiscal".to_s, :count => 2
    assert_select "tr>td", :text => "Codigo Postal".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    assert_select "tr>td", :text => "Preguntar Por".to_s, :count => 2
    assert_select "tr>td", :text => "Fecha Contrato".to_s, :count => 2
    assert_select "tr>td", :text => "Cuota Contrato".to_s, :count => 2
    assert_select "tr>td", :text => "Fecha De Baja".to_s, :count => 2
    assert_select "tr>td", :text => "Fecha Ultimo Aumento".to_s, :count => 2
    assert_select "tr>td", :text => "Cantidad Aumentada".to_s, :count => 2
    assert_select "tr>td", :text => "Banco".to_s, :count => 2
    assert_select "tr>td", :text => "Agencia".to_s, :count => 2
    assert_select "tr>td", :text => "Ccc".to_s, :count => 2
    assert_select "tr>td", :text => "Nif".to_s, :count => 2
    assert_select "tr>td", :text => "Día De Factura".to_s, :count => 2
    assert_select "tr>td", :text => "Días Aplazado".to_s, :count => 2
    assert_select "tr>td", :text => "Iva".to_s, :count => 2
    assert_select "tr>td", :text => "Descuento".to_s, :count => 2
    assert_select "tr>td", :text => "Tipo De Servicio".to_s, :count => 2
    assert_select "tr>td", :text => "Observaciones".to_s, :count => 2
    assert_select "tr>td", :text => "Web".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
