json.extract! album, :id, :artist_id, :name, :genre, :release_date, :format, :created_at, :updated_at
json.url album_url(album, format: :json)