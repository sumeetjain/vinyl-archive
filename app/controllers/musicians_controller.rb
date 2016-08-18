class MusiciansController < ApplicationController

	def show
		@musician = Musician.find(params[:id])
		@albums = Album.where(:artist_id => @musician.artist_id)
	end
end
