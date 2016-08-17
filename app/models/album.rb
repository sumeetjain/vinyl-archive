class Album < ActiveRecord::Base
	include PgSearch
	multisearchable :against => [:artist_id, :name]

	# Returns a sorted array of albums
	#
	# albums => array of Albums to be sorted
	# sortby => determines if albums are sorted by title, artist or date
	#
	def Album.getSortedList(albums, sortby)
		if sortby=="title"
			return Album.sortTitle(albums)
		elsif sortby=="artist"
			return Album.sortArtist(albums)
		elsif sortby=="date"
			return Album.sortDate(albums)
		end
	end

	# Returns an array of albums sorted by album title
	#
	# albums => array of Albums to be sorted
	# 
	def Album.sortTitle(albums)
		order = {}
		return_arr = []
		i=0
		albums.each do |album|
			order[i]=album["name"]
			i+=1
		end

		order = order.sort_by {|_key, value| value}

		order.each do |key, value|
			return_arr.push(albums[key])
		end
		return return_arr
	end

	# Returns an array of albums sorted by artist name
	#
	# albums => array of Albums to be sorted
	# 
	def Album.sortArtist(albums)
		order = {}
		return_arr = []
		i=0
		albums.each do |album|
			artist = Artist.find(album["artist_id"])
			order[i]=artist
			i+=1
		end

		order = order.sort_by {|_key, value| value}

		order.each do |key, value|
			return_arr.push(albums[key])
		end
		return return_arr
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
