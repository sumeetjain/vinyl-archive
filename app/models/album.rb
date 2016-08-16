class Album < ActiveRecord::Base
	belongs_to :artist
	# has_and_belongs_to_many :musicians
	has_many :musicians, :through => :artist
	# belongs_to :musician, :class_name => :artist
	accepts_nested_attributes_for :artist, :musicians
	# accepts_nested_attributes_for :musician
end
