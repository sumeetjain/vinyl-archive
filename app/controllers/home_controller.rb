class HomeController < ApplicationController
	
	before_action :authenticate_user!
	
	def index
		if params.exclude?('city')
			@albums = Album.all
		else
 			@albums = Album.get_albums_by_city(params['city'])
		end

		@array_of_cities = Album.list_of_locations

		@hash_of_city_albums_count = Album.count_of_albums_per_city

	end
	
end
