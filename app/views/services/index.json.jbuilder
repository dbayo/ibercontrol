json.array!(@services) do |service|
  json.extract! service, :id, :fecha_servicio, :emitida, :aplicada
  json.url service_url(service, format: :json)
end
