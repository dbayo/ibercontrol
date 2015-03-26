require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post :create, client: { agencia: @client.agencia, banco: @client.banco, cantidad_aumentada: @client.cantidad_aumentada, ccc: @client.ccc, codigo_postal: @client.codigo_postal, cuota_contrato: @client.cuota_contrato, descuento: @client.descuento, direccion_fiscal: @client.direccion_fiscal, día_de_factura: @client.día_de_factura, días_aplazado: @client.días_aplazado, email: @client.email, fax: @client.fax, fecha_contrato: @client.fecha_contrato, fecha_de_baja: @client.fecha_de_baja, fecha_ultimo_aumento: @client.fecha_ultimo_aumento, iva: @client.iva, nif: @client.nif, nombre_fiscal: @client.nombre_fiscal, observaciones: @client.observaciones, poblacion_fiscal: @client.poblacion_fiscal, preguntar_por: @client.preguntar_por, telefono_fiscal: @client.telefono_fiscal, tipo_de_servicio: @client.tipo_de_servicio, web: @client.web }
    end

    assert_redirected_to client_path(assigns(:client))
  end

  test "should show client" do
    get :show, id: @client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client
    assert_response :success
  end

  test "should update client" do
    patch :update, id: @client, client: { agencia: @client.agencia, banco: @client.banco, cantidad_aumentada: @client.cantidad_aumentada, ccc: @client.ccc, codigo_postal: @client.codigo_postal, cuota_contrato: @client.cuota_contrato, descuento: @client.descuento, direccion_fiscal: @client.direccion_fiscal, día_de_factura: @client.día_de_factura, días_aplazado: @client.días_aplazado, email: @client.email, fax: @client.fax, fecha_contrato: @client.fecha_contrato, fecha_de_baja: @client.fecha_de_baja, fecha_ultimo_aumento: @client.fecha_ultimo_aumento, iva: @client.iva, nif: @client.nif, nombre_fiscal: @client.nombre_fiscal, observaciones: @client.observaciones, poblacion_fiscal: @client.poblacion_fiscal, preguntar_por: @client.preguntar_por, telefono_fiscal: @client.telefono_fiscal, tipo_de_servicio: @client.tipo_de_servicio, web: @client.web }
    assert_redirected_to client_path(assigns(:client))
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_redirected_to clients_path
  end
end
