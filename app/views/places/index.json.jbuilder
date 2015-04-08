json.array!(@places) do |place|
  json.extract! place, :id, :numero_cliente, :nombre, :direccion, :poblacion, :provincia, :dpostal, :zona, :telefono, :fax, :preguntar_por, :reclamacion, :actividad, :plaga, :area, :observaciones, :plano, :aplicador1, :aplicador2
  json.url place_url(place, format: :json)
end
