json.extract! ride, :id, :owner_id, :origin, :destination, :departure_at, :capacity, :price, :created_at, :updated_at
json.url ride_url(ride, format: :json)
