class Artist < ActiveRecord::Base
	include PgSearch
	multisearchable :against => :name

	has_many :albums
end
