class Album < ActiveRecord::Base
	belongs_to :artist
	has_many :musicians, :through => :artist
	accepts_nested_attributes_for :artist

	include PgSearch
	multisearchable :against => [:artist_id, :name]

	# Returns a sorted array of albums
	#
	# albums => array of Albums to be sorted
	# sortby => determines if albums are sorted by title, artist or date
	#
	def Album.getSortedList(albums, sortby)
		if sortby=="title"
			return albums.order("name")
		elsif sortby=="artist"
			return albums.joins(:artist).order('artists.name')
		elsif sortby=="date"
			return albums.sort_by &:created_at
		end
	end

	# Returns all albums between the dates given
	# 
	# albums => array of albums to be filtered
	# early => early date to create Date instance
	# late => late date to create Date instance
	#
	def Album.timeframe(albums, early, late)
		date1 = Date.new(early)
		date2 = Date.new(late)
		return albums.where("release_date >= ? AND release_date <= ?", date1, date2)
	end

end
