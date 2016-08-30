class ArtistsController < ApplicationController
	def index
		@artists = Artist.all
	end

	def show
		@artist = Artist.find(params[:id])
		@albums = Album.where(:artist_id => @artist.id)

		@array_of_cities = Album.list_of_locations
		@hash_of_city_albums_count = Album.count_of_albums_per_city

		@genres = Album.album_count(Album.uniq.pluck(:genre))
		@format = Album.album_count(Album.uniq.pluck(:format))

	end

	private

end
