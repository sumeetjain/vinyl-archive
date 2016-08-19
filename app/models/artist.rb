class Artist < ActiveRecord::Base
	has_many :albums
	has_many :musicians

	accepts_nested_attributes_for :musicians

	include PgSearch
	multisearchable :against => :name

	has_many :albums
end
