class Song < ActiveRecord::Base
	mount_uploader :song_file, AudioFileUploader
  belongs_to :album
end
