class Album < ActiveRecord::Base
	include PgSearch
	multisearchable :against => [:artist_id, :name]


	def Album.getSortedList(albums, sortby)
		if sortby=="title"
			return Album.sortTitle(albums)
		elsif sortby=="artist"
			return Album.sortArtist(albums)
		elsif sortby=="date"
			return Album.sortDate(albums)
		end
	end

	def Album.sortTitle(albums)
		order = {}
		return_arr = []
		i=0
		albums.each do |album|
			order[album["name"]]=i
			i+=1
		end

		order = order.sort

		order.each do |key, value|
			return_arr.push(albums[value])
		end
		return return_arr
	end


end
