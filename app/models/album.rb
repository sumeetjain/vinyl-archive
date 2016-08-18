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
end
