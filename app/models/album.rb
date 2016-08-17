class Album < ActiveRecord::Base
	include PgSearch
	multisearchable :against => [:artist_id, :name]
	belongs_to :artist

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

end
