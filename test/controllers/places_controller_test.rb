require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  setup do
    @place = places(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:places)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create place" do
    assert_difference('Place.count') do
      post :create, place: { actividad: @place.actividad, aplicador1: @place.aplicador1, aplicador2: @place.aplicador2, area: @place.area, dirección: @place.dirección, dpostal: @place.dpostal, fax: @place.fax, nombre: @place.nombre, numero_cliente: @place.numero_cliente, numero_de_orden: @place.numero_de_orden, observaciones: @place.observaciones, plaga: @place.plaga, plano: @place.plano, población: @place.población, preguntar_por: @place.preguntar_por, provincia: @place.provincia, reclamación: @place.reclamación, teléfono: @place.teléfono, zona: @place.zona }
    end

    assert_redirected_to place_path(assigns(:place))
  end

  test "should show place" do
    get :show, id: @place
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @place
    assert_response :success
  end

  test "should update place" do
    patch :update, id: @place, place: { actividad: @place.actividad, aplicador1: @place.aplicador1, aplicador2: @place.aplicador2, area: @place.area, dirección: @place.dirección, dpostal: @place.dpostal, fax: @place.fax, nombre: @place.nombre, numero_cliente: @place.numero_cliente, numero_de_orden: @place.numero_de_orden, observaciones: @place.observaciones, plaga: @place.plaga, plano: @place.plano, población: @place.población, preguntar_por: @place.preguntar_por, provincia: @place.provincia, reclamación: @place.reclamación, teléfono: @place.teléfono, zona: @place.zona }
    assert_redirected_to place_path(assigns(:place))
  end

  test "should destroy place" do
    assert_difference('Place.count', -1) do
      delete :destroy, id: @place
    end

    assert_redirected_to places_path
  end
end
