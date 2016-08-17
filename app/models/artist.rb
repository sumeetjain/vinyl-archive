class Artist < ActiveRecord::Base
	include PgSearch
	multisearchable :against => :name
end
