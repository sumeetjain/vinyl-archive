class Album < ActiveRecord::Base
	belongs_to :artist
	has_many :musicians, :through => :artist
	accepts_nested_attributes_for :artist, :musicians

	include PgSearch
	multisearchable :against => [:artist_id, :name]

end
