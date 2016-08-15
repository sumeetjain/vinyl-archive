class Album < ActiveRecord::Base
	belongs_to :artist
	has_many :artists

	accepts_nested_attributes_for :artist
	
end
