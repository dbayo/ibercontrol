json.array!(@places) do |place|
  json.extract! place, :id, :numero_cliente, :numero_de_orden, :nombre, :dirección, :población, :provincia, :dpostal, :zona, :teléfono, :fax, :preguntar_por, :reclamación, :actividad, :plaga, :area, :observaciones, :plano, :aplicador1, :aplicador2
  json.url place_url(place, format: :json)
end
