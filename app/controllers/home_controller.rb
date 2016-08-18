class HomeController < ApplicationController
	
	before_action :authenticate_user!
	
	def index
		if params.exclude?('city')
			artist_array = Artist.all
			@albums = Album.all

		else
			artist_array = Artist.where("city = ?", params['city'])
			albums = Array.new
			artist_array.each_with_index do |record, index|
				albums[index] = Album.where("artist_id = ?", record['id'])
			end
			@albums = albums.flatten

		end

		@needed_array = Array.new
		artist_array = Artist.all
		artist_array.each do |stuff|
			if @needed_array.include? stuff.city
			else
				@needed_array.push(stuff.city)
			end
		end
	end
	
end
