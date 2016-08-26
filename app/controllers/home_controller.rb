class HomeController < ApplicationController
	if Rails.env.development?	
		before_action :authenticate_user!
	end
	
	def index
		@genres = Album.uniq.pluck(:genre)
		if params[:city]
			@albums = Album.get_albums_by_city(params['city'])
			# @albums = @albums.page(params[:page]).per(9)

		elsif params[:genre]
			@albums = Album.genres(genre: params[:genre])
			# @albums = @albums.page(params[:page]).per(9)
			
		else
 			@albums = Album.all
		end

		@array_of_cities = Album.list_of_locations

		@hash_of_city_albums_count = Album.count_of_albums_per_city

	end
	
end
