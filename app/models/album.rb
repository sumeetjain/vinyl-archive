class Album < ActiveRecord::Base
	belongs_to :artist
	belongs_to :musician
	# belongs_to :musician, :class_name => :artist
	accepts_nested_attributes_for :artist
	# accepts_nested_attributes_for :musician
end
