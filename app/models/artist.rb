class Artist < ActiveRecord::Base
	has_many :albums
	has_many :musicians

	include PgSearch
	multisearchable :against => :name

end
