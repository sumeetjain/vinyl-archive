class SongsController < ApplicationController

  # GET /songs/new
  def new
    @song = Song.new
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)
    @song.save
    redirect_to '/songs/new'
  end

  private

    def song_params
      params.require(:song).permit(:album_id, :song_name, :song_file)
    end

end
