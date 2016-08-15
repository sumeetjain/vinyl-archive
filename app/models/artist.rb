class Artist < ActiveRecord::Base
	has_many :albums
	has_many :musicians
	# accepts_nested_attributes_for :albums

end
