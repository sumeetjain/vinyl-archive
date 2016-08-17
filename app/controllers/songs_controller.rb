require 'pry'

class SongsController < ApplicationController

  # GET /songs/new
  def new
    @song = Song.new
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)
    @song.song_file = params[:file]
    @song.song_name = params['song']['song_name']
    @song.album_id = params['song']['album_id']
    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def song_params
      params.require(:song).permit(:audio_file, :album_id, :song_name, :song_file)
    end

end
