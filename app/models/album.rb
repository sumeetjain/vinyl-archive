class Album < ActiveRecord::Base
	belongs_to :artist
	has_many :musicians, :through => :artist
	accepts_nested_attributes_for :artist
	mount_uploader :file, AudioFileUploader

	include PgSearch
	multisearchable :against => [:artist_id, :name]

	def self.genres(genre={})
		Album.where(genre)
	end

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

	def self.get_albums_by_city(city)
		artist_array = Artist.where("city = ?", city)
		albums = Array.new
		artist_array.each_with_index do |record, index|
			albums[index] = Album.where("artist_id = ?", record['id'])
		end
		albums = albums.flatten
		return albums
	end


	def self.list_of_locations
		array_of_cities = Array.new
		artist_array = Artist.all

		artist_array.each do |artist_record|
			if array_of_cities.exclude? artist_record.city
				array_of_cities.push(artist_record.city)
			end
		end

		return array_of_cities
	end

	def self.count_of_albums_per_city
		hash_of_city_albums_count = Hash.new
		array_of_cities = Album.list_of_locations

		array_of_cities.each do |city_name|
			hash_of_city_albums_count[city_name] = Album.get_albums_by_city(city_name).size
		end

		return hash_of_city_albums_count
	end

	# Returns array of Albums filtered by format
	#
	# albums => array of albums to filter
	# format => formatting keyword "LP" "EP" or "Single"
	#
	def Album.formatFilter(albums, format)
		return albums.where(:format => format)
	end

	# Returns filtered array based on keyword.  
	# Can be discarded if we use another system for filtering
	#
	# albums => array of albums to filter
	# filter => filter keyword
	#
	def Album.filter(albums, filter)
		if ((filter=="LP")|| (filter=="EP") || (filter=="Single"))
			return Album.formatFilter(albums, filter)
		end
	end

	def self.album_count(input)
        count = {}
        if input == ["LP", "EP", "Single"]
            column = :format
        else
            column = :genre
        end
        input.each do |input|
            album_count = Album.where(column => input)
            count[input] = album_count.count
        end
        return count
    end

end
