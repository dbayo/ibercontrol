require 'rails_helper'

RSpec.describe "clients/edit", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      :nombre_fiscal => "MyString",
      :direccion_fiscal => "MyString",
      :poblacion_fiscal => "MyString",
      :telefono_fiscal => "MyString",
      :codigo_postal => "MyString",
      :fax => "MyString",
      :preguntar_por => "MyString",
      :fecha_contrato => "MyString",
      :cuota_contrato => "MyString",
      :fecha_de_baja => "MyString",
      :fecha_ultimo_aumento => "MyString",
      :cantidad_aumentada => "MyString",
      :banco => "MyString",
      :agencia => "MyString",
      :ccc => "MyString",
      :nif => "MyString",
      :dia_de_factura => "MyString",
      :dias_aplazado => "MyString",
      :iva => "MyString",
      :descuento => "MyString",
      :tipo_de_servicio => "MyString",
      :observaciones => "MyString",
      :web => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit client form" do
    render

    assert_select "form[action=?][method=?]", client_path(@client), "post" do

      assert_select "input#client_nombre_fiscal[name=?]", "client[nombre_fiscal]"

      assert_select "input#client_direccion_fiscal[name=?]", "client[direccion_fiscal]"

      assert_select "input#client_poblacion_fiscal[name=?]", "client[poblacion_fiscal]"

      assert_select "input#client_telefono_fiscal[name=?]", "client[telefono_fiscal]"

      assert_select "input#client_codigo_postal[name=?]", "client[codigo_postal]"

      assert_select "input#client_fax[name=?]", "client[fax]"

      assert_select "input#client_preguntar_por[name=?]", "client[preguntar_por]"

      assert_select "input#client_fecha_contrato[name=?]", "client[fecha_contrato]"

      assert_select "input#client_cuota_contrato[name=?]", "client[cuota_contrato]"

      assert_select "input#client_fecha_de_baja[name=?]", "client[fecha_de_baja]"

      assert_select "input#client_fecha_ultimo_aumento[name=?]", "client[fecha_ultimo_aumento]"

      assert_select "input#client_cantidad_aumentada[name=?]", "client[cantidad_aumentada]"

      assert_select "input#client_banco[name=?]", "client[banco]"

      assert_select "input#client_agencia[name=?]", "client[agencia]"

      assert_select "input#client_ccc[name=?]", "client[ccc]"

      assert_select "input#client_nif[name=?]", "client[nif]"

      assert_select "input#client_dia_de_factura[name=?]", "client[dia_de_factura]"

      assert_select "input#client_dias_aplazado[name=?]", "client[dias_aplazado]"

      assert_select "input#client_iva[name=?]", "client[iva]"

      assert_select "input#client_descuento[name=?]", "client[descuento]"

      assert_select "input#client_tipo_de_servicio[name=?]", "client[tipo_de_servicio]"

      assert_select "input#client_observaciones[name=?]", "client[observaciones]"

      assert_select "input#client_web[name=?]", "client[web]"

      assert_select "input#client_email[name=?]", "client[email]"
    end
  end
end
