require 'rails_helper'

describe 'artists' do

	let! (:artist) {Artist.create(:name=>"New Band", :city=>"Fremont", :url=>"fake.jpg", :bio=>"cool guys")}
	let! (:album) {Album.create(artist_id: artist.id, name: "Big Kahuna", genre: "Rock", release_date: "2008")}
	let! (:album2) {Album.create(artist_id: artist.id, name: "Red Rocket", genre: "Blues", release_date: "1999")}
	let! (:album3) {Album.create(artist_id: artist.id, name: "Dance Dance!", genre: "Electronic", release_date: "2011")}
	it 'displays artist albums' do
		binding.pry
		visit "/artists/#{artist.id}"
		page.should have_content("Big Kahuna")
		page.should have_content("Red Rocket")
		page.should have_content("Dance Dance!")
	end

	it 'links to album' do
		visit "/artists/#{artist.id}"
		click_link 'Big Kahuna'
		page.should have_content('Big Kahuna')
	end
end