require 'rails_helper'

RSpec.describe "bills/new", type: :view do
  before(:each) do
    assign(:bill, Bill.new(
      :numero_factura => "MyString",
      :estado => "MyString",
      :fecha_factura => "MyString",
      :year => "MyString",
      :nif => "MyString",
      :nombre_fis => "MyString",
      :direccion_fis => "MyString",
      :poblacion_fis => "MyString",
      :provincia_fis => "MyString",
      :dpostal_fis => "MyString",
      :periodo_desde => "MyString",
      :periodo_hasta => "MyString",
      :tipo_servicio => "MyString",
      :nombre_apl => "MyString",
      :direccion_apl => "MyString",
      :poblacion_apl => "MyString",
      :provincia_apl => "MyString",
      :dpostal_apl => "MyString",
      :base_imponible => "MyString",
      :base_impuestos_sin_descuentos => "MyString",
      :descuento => "MyString",
      :total_descuento => "MyString",
      :iva => "MyString",
      :total_iva => "MyString",
      :total_factura => "MyString",
      :numero_recibo => "MyString",
      :fecha_vencimiento => "MyString",
      :banco => "MyString",
      :agencia => "MyString",
      :ccc => "MyString",
      :observaciones => "MyString",
      :cobrada => "MyString",
      :fecha_cobrada => "MyString",
      :abonada => "MyString",
      :morosa => "MyString",
      :extras => "MyString",
      :client => nil
    ))
  end

  it "renders new bill form" do
    render

    assert_select "form[action=?][method=?]", client_bills_path(@client), "post" do

      assert_select "input#bill_numero_factura[name=?]", "bill[numero_factura]"

      assert_select "input#bill_estado[name=?]", "bill[estado]"

      assert_select "input#bill_fecha_factura[name=?]", "bill[fecha_factura]"

      assert_select "input#bill_year[name=?]", "bill[year]"

      assert_select "input#bill_nif[name=?]", "bill[nif]"

      assert_select "input#bill_nombre_fis[name=?]", "bill[nombre_fis]"

      assert_select "input#bill_direccion_fis[name=?]", "bill[direccion_fis]"

      assert_select "input#bill_poblacion_fis[name=?]", "bill[poblacion_fis]"

      assert_select "input#bill_provincia_fis[name=?]", "bill[provincia_fis]"

      assert_select "input#bill_dpostal_fis[name=?]", "bill[dpostal_fis]"

      assert_select "input#bill_periodo_desde[name=?]", "bill[periodo_desde]"

      assert_select "input#bill_periodo_hasta[name=?]", "bill[periodo_hasta]"

      assert_select "input#bill_tipo_servicio[name=?]", "bill[tipo_servicio]"

      assert_select "input#bill_nombre_apl[name=?]", "bill[nombre_apl]"

      assert_select "input#bill_direccion_apl[name=?]", "bill[direccion_apl]"

      assert_select "input#bill_poblacion_apl[name=?]", "bill[poblacion_apl]"

      assert_select "input#bill_provincia_apl[name=?]", "bill[provincia_apl]"

      assert_select "input#bill_dpostal_apl[name=?]", "bill[dpostal_apl]"

      assert_select "input#bill_base_imponible[name=?]", "bill[base_imponible]"

      assert_select "input#bill_base_impuestos_sin_descuentos[name=?]", "bill[base_impuestos_sin_descuentos]"

      assert_select "input#bill_descuento[name=?]", "bill[descuento]"

      assert_select "input#bill_total_descuento[name=?]", "bill[total_descuento]"

      assert_select "input#bill_iva[name=?]", "bill[iva]"

      assert_select "input#bill_total_iva[name=?]", "bill[total_iva]"

      assert_select "input#bill_total_factura[name=?]", "bill[total_factura]"

      assert_select "input#bill_numero_recibo[name=?]", "bill[numero_recibo]"

      assert_select "input#bill_fecha_vencimiento[name=?]", "bill[fecha_vencimiento]"

      assert_select "input#bill_banco[name=?]", "bill[banco]"

      assert_select "input#bill_agencia[name=?]", "bill[agencia]"

      assert_select "input#bill_ccc[name=?]", "bill[ccc]"

      assert_select "input#bill_observaciones[name=?]", "bill[observaciones]"

      assert_select "input#bill_cobrada[name=?]", "bill[cobrada]"

      assert_select "input#bill_fecha_cobrada[name=?]", "bill[fecha_cobrada]"

      assert_select "input#bill_abonada[name=?]", "bill[abonada]"

      assert_select "input#bill_morosa[name=?]", "bill[morosa]"

      assert_select "input#bill_extras[name=?]", "bill[extras]"

      assert_select "input#bill_client_id[name=?]", "bill[client_id]"
    end
  end
end
