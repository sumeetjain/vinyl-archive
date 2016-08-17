class Album < ActiveRecord::Base
	include PgSearch
	multisearchable :against => [:artist_id, :name]
end
