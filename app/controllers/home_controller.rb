class HomeController < ApplicationController
	if Rails.env.development?	
		before_action :authenticate_user!
	end
	
	def index
		@genres = Album.album_count(Album.uniq.pluck(:genre))
		@format = Album.album_count(Album.uniq.pluck(:format))
		if params[:city]
			@albums = Album.get_albums_by_city(params['city'])
			@albums = @albums.page(params[:page]).per(9)

		elsif params[:genre]
			@albums = Album.genres(genre: params[:genre])
			@albums = @albums.page(params[:page]).per(9)
			@genre = params['genre']
		
		elsif params[:format]
			@albums = Album.filter(Album.all, params[:format])
			
		else
 			@albums = Album.all.page(params[:page]).per(9)
		end

		@array_of_cities = Album.list_of_locations

		@hash_of_city_albums_count = Album.count_of_albums_per_city
		# @genre_album_count = Album.count_of_albums_per_genre

	end
	
end
