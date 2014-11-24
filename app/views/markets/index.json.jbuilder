json.array!(@markets) do |market|
  json.extract! market, :id, :name, :cnpj, :address, :latitude, :longitude
  json.url market_url(market, format: :json)
end
