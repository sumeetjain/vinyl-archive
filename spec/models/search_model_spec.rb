require 'rails_helper'

RSpec.describe Search, type: :model do

	let! (:artist) {Artist.create(:name=>"Big Band", :city=>"Fremont", :url=>"fake.jpg", :bio=>"cool guys")}
	let! (:album) {Album.create(artist_id: artist.id, name: "Big Kahuna", genre: "Rock", release_date: "2008")}
	let! (:album2) {Album.create(artist_id: artist.id, name: "Red Rocket", genre: "Blues", release_date: "1999")}
	let! (:album3) {Album.create(artist_id: artist.id, name: "Dance Dance!", genre: "Electronic", release_date: "2011")}

	it 'displays all albums for search term' do
		visit "/search/show?query=Big"

		page.should have_content("Big Kahuna")
		page.should have_content("Red Rocket")
		page.should have_no_content("Big Band")
	end

	it 'fills out the form and gets results' do
		visit "/search"

		fill_in('query', :with => 'Big')
		click_button('Search')

		page.should have_content("Big Kahuna")
		page.should have_content("Red Rocket")
		page.should have_no_content("Big Band")
	end

end