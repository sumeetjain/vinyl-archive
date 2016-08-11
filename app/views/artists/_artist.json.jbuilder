json.extract! artist, :id, :name, :city, :url, :bio, :created_at, :updated_at
json.url artist_url(artist, format: :json)