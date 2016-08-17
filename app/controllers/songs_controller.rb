require 'pry'

class SongsController < ApplicationController

  # GET /songs/new
  def new
    @song = Song.new
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new
    @song.song_file = params[:song_file]
    @song.song_name = params['song']['song_name']
    @song.album_id = params['song']['album_id']
    @song.save
    redirect_to '/songs/new'
  end

  private

    def song_params
      params.require(:song).permit(:album_id, :song_name, :song_file)
    end

end
