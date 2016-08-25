class ApiController < ApplicationController
	def index
        @albums = Album.all  
		@artists = Artist.all 
		render json: {albums: @albums, artists: @artists }
    end
end
