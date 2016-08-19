require 'rails_helper'
 
 RSpec.describe Musician, type: :model do
 
	let! (:artist) {Artist.create(:name=>"New Band", :city=>"Fremont", :url=>"http://www.fake.jpg", :bio=>"cool guys")}
	let! (:artist2) {Artist.create(:name=>"Zephyrs", :city=>"Nickerson", :url=>"fake.jpg", :bio=>"cool guys")}

	let! (:album) {Album.create(artist_id: artist.id, name: "Big Kahuna", genre: "Rock", release_date: Date.new(2009))}
	let! (:album2) {Album.create(artist_id: artist2.id, name: "Red Rocket", genre: "Blues", release_date: Date.new(1999))}
	let! (:album3) {Album.create(artist_id: artist3.id, name: "Dance Dance!", genre: "Electronic", release_date: Date.new(2011))}
	let! (:album4) {Album.create(artist_id: artist2.id, name: "Alpha", genre: "Electronic", release_date: Date.new(2000))}
	let! (:album5) {Album.create(artist_id: artist.id, name: "Zeta", genre: "Electronic", release_date: Date.new(2010))}

	let!(:musician) { Musician.create(artist_id: artist.id, name: "James Biggins", instrument: "Piano") }
	let!(:musician2) { Musician.create(artist_id: artist2.id, name: "Bugs Bunny", instrument: "Guitar") }
 
	it 'displays musician albums, name and edit link' do
		
		visit "musicians/#{musician.id}"

		expect(page).to have_content(musician.name)
		expect(page).to have_content(album.name)
		expect(page).to have_content(album5.name)
		expect(page).to have_no_content(album2.name )
		expect(page).to have_css("img[src*='#{artist.url}']")

		click_link 'Edit Musician'

		expect(page).to have_content(musician.id)
	end

 end 