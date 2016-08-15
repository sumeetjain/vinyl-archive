require 'rails_helper'

describe 'artists' do

	let!(:arist) {Artist.create(:name=>"New Band", :city=>"Fremont", :url=>"fake.jpg", :bio=>"cool guys") }
	let!(:album) { Album.create(artist_id: 1, name: "Big Kahuna", genre: "Rock", release_date: "2008") }
	let!(:album2) { Album.create(artist_id: 1, name: "Red Rocket", genre: "Blues", release_date: "1999") }
	let!(:album3) { Album.create(artist_id: 1, name: "Dance Dance!", genre: "Electronic", release_date: "2011") }
	binding.pry
	it 'displays artist albums' do
		visit '/artists/1'
		page.should have_content("Big Kahuna")
		page.should have_content("Red Rocket")
		page.should have_content("Dance Dance!")
	end

	it 'links to album' do
		visit '/artists/1'
		click_link 'Big Kahuna'
		page.should have_content('Big Kahuna')
	end
end