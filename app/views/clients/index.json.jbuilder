json.array!(@clients) do |client|
  json.extract! client, :id, :nombre_fiscal, :direccion_fiscal, :poblacion_fiscal, :telefono_fiscal, :codigo_postal, :fax, :preguntar_por, :fecha_contrato, :cuota_contrato, :fecha_de_baja, :fecha_ultimo_aumento, :cantidad_aumentada, :banco, :agencia, :ccc, :nif, :dia_de_factura, :dias_aplazado, :iva, :descuento, :tipo_de_servicio, :observaciones, :web, :email
  json.url client_url(client, format: :json)
end
