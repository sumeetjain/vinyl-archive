class ApiController < ApplicationController
	def index
    album = Album.find_by_name(params[:album])
		artist = Artist.find_by_name(params[:artist])

    if album && artist
      response = {album: "exists", artist: "exists"}
    elsif artist
      response = {album: "does not exist", artist: "exists"}
    else
      response = {album: "does not exist", artist: "does not exist"}
    end

    render json: response
  end
end
