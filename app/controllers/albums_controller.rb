class AlbumsController < ApplicationController

	def index
		@genres = Album.uniq.pluck(:genre)

		if params[:genre]
			@albums = Album.genres(genre: params[:genre])
			@albums = @albums.page(params[:page]).per(3)
		else
			@albums = Album.all.page(params[:page]).per(3)
		end

		if params[:sort].nil?
			@albums = Album.all.page(params[:page]).per(3)
		else
			@albums = Album.filter(Album.all, params[:sort]).page(params[:page]).per(3)
		end
				@array_of_cities = Album.list_of_locations

		@hash_of_city_albums_count = Album.count_of_albums_per_city
		# @genre_album_count = Album.count_of_albums_per_genre

	end

	def show

		@album = Album.find(params[:id])
		@photo = Photo.where(:album_id => params[:id])
		@songs = Song.where(:album_id => params[:id])
		@date = Date.parse(@album.release_date.to_s).strftime('%B %-d, %Y')

	end

	def new
		@album = Album.new
		@album.build_artist

		3.times do
			@album.artist.musicians.build
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
		params.require(:album).permit(:name, :genre, :release_date, :format, :file,
																 artist_attributes: [:name, :city, :url, :bio, musicians_attributes: [:name, :instrument]])
	end
end



