class MusiciansController < ApplicationController
	def index
		@musicians = Musician.all.page(params[:page]).per(3)
	end

	def show
		@musician = Musician.find(params[:id])
		@albums = Album.where(:artist_id => @musician.artist.id)
		@img = Artist.find(@musician.artist_id).url

		@array_of_cities = Album.list_of_locations

		@hash_of_city_albums_count = Album.count_of_albums_per_city
		@genres = Album.album_count(Album.uniq.pluck(:genre))
		@format = Album.album_count(Album.uniq.pluck(:format))

		@artist = Artist.find(params[:id])
	end
	
		# @genre_album_count = Album.count_of_albums_per_genre

	
end
