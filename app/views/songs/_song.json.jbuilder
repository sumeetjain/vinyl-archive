json.extract! song, :id, :song_file, :song_name, :created_at, :updated_at
json.url song_url(song, format: :json)