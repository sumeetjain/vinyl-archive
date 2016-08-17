class Album < ActiveRecord::Base
	belongs_to :artist
	has_many :musicians, :through => :artist
	accepts_nested_attributes_for :artist

	include PgSearch
	multisearchable :against => [:artist_id, :name]

	def self.genres(genre={})
		Album.where(genre)
	end

end
