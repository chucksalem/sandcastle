json.array!(@rentals) do |rental|
  json.extract! rental, :id
  json.url rental_url(rental, format: :json)
end
