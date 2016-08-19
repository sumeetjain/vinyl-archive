class Photo < ActiveRecord::Base
	mount_uploader :the_photo, Image_FileUploader
end
