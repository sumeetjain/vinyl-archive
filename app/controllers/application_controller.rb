class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

  before_action :initialize_new_album

  def initialize_new_album
    @new_album = Album.new
    @new_album.build_artist

    3.times do
      @new_album.artist.musicians.build
    end

    6.times do
      @new_album.photos.build
    end

    20.times do
      @new_album.songs.build
    end
  end
end
