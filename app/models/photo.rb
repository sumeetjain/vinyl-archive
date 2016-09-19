class Photo < ActiveRecord::Base
	mount_uploader :the_photo, ImageFileUploader
  belongs_to :album
end
