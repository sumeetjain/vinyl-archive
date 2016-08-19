class Photo < ActiveRecord::Base
	mount_uploader :the_photo, ImageFileUploader
end
