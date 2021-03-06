json.array!(@bills) do |bill|
  json.extract! bill, :id, :numero_factura, :estado, :fecha_factura, :year, :nif, :nombre_fis, :direccion_fis, :poblacion_fis, :provincia_fis, :dpostal_fis, :periodo_desde, :periodo_hasta, :tipo_servicio, :nombre_apl, :direccion_apl, :poblacion_apl, :provincia_apl, :dpostal_apl, :base_imponible, :base_impuestos_sin_descuentos, :descuento, :total_descuento, :iva, :total_iva, :total_factura, :numero_recibo, :fecha_vencimiento, :banco, :agencia, :ccc, :observaciones, :cobrada, :fecha_cobrada, :abonada, :morosa, :extras, :client_id
  json.url bill_url(bill, format: :json)
end
