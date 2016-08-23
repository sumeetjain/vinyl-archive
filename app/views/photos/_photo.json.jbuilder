json.extract! photo, :id, :the_photo, :album_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)