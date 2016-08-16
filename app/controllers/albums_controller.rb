class AlbumsController < ApplicationController

	def index
		@albums = Album.all
	end

	def show
		@album = Album.find(params[:id])
	end

	def new
		@album = Album.new
		@album.build_artist

		3.times do
			@album.musicians.build
		end
	end

	def create
		@album = Album.new(album_params)

		if @album.save
			redirect_to album_path(@album.id)
		else
			render :new
		end
	end

	private
	def album_params
		params.require(:album).permit(:name, :genre, :release_date, :format,
																 artist_attributes: [:name, :city, :url, :bio],
																 musician_attributes: [:name, :instrument])
	end
end



