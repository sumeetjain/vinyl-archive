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

	# Returns an array of albums sorted by date added
	#
	# albums => array of Albums to be sorted
	# 
	def Album.sortDate(albums)
		order = {}
		return_arr = []
		i=0
		albums.each do |album|
			order[i]=album["created_at"]
			i+=1
		end

		order = order.sort_by {|_key, value| value}

		order.each do |key, value|
			return_arr.push(albums[key])
		end
		return return_arr
	end

end
