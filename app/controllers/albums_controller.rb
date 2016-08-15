class AlbumsController < ApplicationController

	def index
		@albums = Album.all
	end

	def show
		@album = Album.find(params[:id])
	end

	def new
		@artist = Artist.new
		@album = @artist.albums.new

		
		
	end

	def create
		@artist = Artist.new

		@album = @artist.albums.new(album_params)

		if @album.save
			redirect_to album_path(@album.id)
		else
			render :new
		end
	end

	private
	def album_params
		params.require(:album).permit(:name, artists_attributes: [:name, :id])
	end
end
