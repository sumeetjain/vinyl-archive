class Song < ActiveRecord::Base
	mount_uploader :song_file, AudioFileUploader
end
