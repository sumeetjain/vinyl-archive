class Search
	def Search.keywordSearch(query)
		return_arr = []
		results = []
		results.push(PgSearch.multisearch(query))
		results.each do |entry|
			if entry["searchable_type"] == "Album"
				return_arr.push(Album.find(entry.searchable_id))
			elsif entry["searchable_type"] == "Artist"
				return_arr += Album.where(:artist_id=>entry.searchable_id)
			end
		end

		return return_arr
	end
end