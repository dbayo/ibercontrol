json.array!(@contracts) do |contract|
  json.extract! contract, :id, :plazos, :price
  json.url contract_url(contract, format: :json)
end
