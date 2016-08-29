json.array!(@accommodations) do |accommodation|
  json.extract! accommodation, :id
  json.url accommodation_url(accommodation, format: :json)
end
