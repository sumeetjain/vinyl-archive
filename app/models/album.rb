class Album < ActiveRecord::Base
	has_many :artists

	accepts_nested_attributes_for :artists


	
end
