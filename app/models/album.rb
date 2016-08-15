class Album < ActiveRecord::Base
	belongs_to :artist

	accepts_nested_attributes_for :artist
	
end
