json.array!(@hotellists) do |hotellist|
  json.extract! hotellist, :id
  json.url hotellist_url(hotellist, format: :json)
end
