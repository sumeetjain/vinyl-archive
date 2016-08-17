class Album < ActiveRecord::Base
	belongs_to :artist
	has_many :musicians, :through => :artist
	accepts_nested_attributes_for :artist

	include PgSearch
	multisearchable :against => [:artist_id, :name]

	# Returns all albums between the dates given
	# 
	# albums => array of albums to be filtered
	# early => early date to create Date instance
	# late => late date to create Date instance
	#
	def Album.timeframe(albums, early, late)
		date1 = Date.new(early)
		date2 = Date.new(late)
		return albums.where("release_date > ? AND release_date < ?", date1, date2)
	end
end
