class HomeController < ApplicationController
	
	before_action :authenticate_user!
	
	def index
		if params.exclude?('city')
			artist_array = Artist.all
			@albums = Album.all
		else
 			@albums = Album.get_albums_by_city(params['city'])
		end

		@array_of_cities = Array.new
		artist_array = Artist.all

		artist_array.each do |artist_record|
			if @array_of_cities.exclude? artist_record.city
				@array_of_cities.push(artist_record.city)
			end
		end

		@hash_of_city_albums_count = Hash.new

		@array_of_cities.each do |city_name|
			@hash_of_city_albums_count[city_name] = Album.get_albums_by_city(params[city_name]).size
		end

	end
	
end
