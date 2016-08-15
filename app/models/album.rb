class Album < ActiveRecord::Base
	belongs_to :artist
	has_many :artists
# This doesn't seem to really be doing anything to the form...
	accepts_nested_attributes_for :artists
	
end
