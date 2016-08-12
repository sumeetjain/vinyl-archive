require 'rails_helper'

describe 'artists' do

	Artist.create(:name=>"New Band", :city=>"Fremont", :url=>"fake.jpg", :bio=>"cool guys")
	Album.create(:artist_id=>1, :name=>"Their album")
	Album.create(:artist_id=>1, :name=>"Album Two")

	it 'displays artist albums' do
		visit '/artists/1'
		page.should have_content('Their album')
		page.should have_content('Album Two')
	end

	it 'links to album' do
		visit '/artists/1'
		click_link 'Their album'
		page.should have_content('Their album')
	end

end