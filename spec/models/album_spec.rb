require 'rails_helper'

RSpec.describe Album, type: :model do

  	let! (:artist) {Artist.create(:name=>"New Band", :city=>"Fremont", :url=>"fake.jpg", :bio=>"cool guys")}
  	let! (:artist2) {Artist.create(:name=>"Zephyrs", :city=>"Nickerson", :url=>"fake.jpg", :bio=>"cool guys")}
  	let! (:artist3) {Artist.create(:name=>"Agnostics", :city=>"Broken Bow", :url=>"fake.jpg", :bio=>"cool guys")}
	
	let! (:album) {Album.create(artist_id: artist.id, name: "Big Kahuna", genre: "Rock", release_date: "2008")}
	let! (:album2) {Album.create(artist_id: artist2.id, name: "Red Rocket", genre: "Blues", release_date: "1999")}
	let! (:album3) {Album.create(artist_id: artist3.id, name: "Dance Dance!", genre: "Electronic", release_date: "2011")}
	let! (:album4) {Album.create(artist_id: artist2.id, name: "Alpha", genre: "Electronic", release_date: "2011")}
	let! (:album5) {Album.create(artist_id: artist.id, name: "Zeta", genre: "Electronic", release_date: "2011")}

	it 'sorts by title' do
		albums = Album.getSortedList(Album.all, "title")
		expect(albums[0]).to eq(album4)
		expect(albums[1]).to eq(album)
		expect(albums[2]).to eq(album3)
		expect(albums[3]).to eq(album2)
		expect(albums[4]).to eq(album5)
	end

	it 'sorts by artist' do
		albums = Album.getSortedList(Album.all, "artist")
		expect(albums[0]).to eq(album3)
		expect(albums[1]).to eq(album)
		expect(albums[2]).to eq(album5)
		expect(albums[3]).to eq(album2)
		expect(albums[4]).to eq(album4)
	end

	it 'sorts by date added' do
		albums = Album.getSortedList(Album.all, "title")
		albums = Album.getSortedList(albums, "date")
		expect(albums[0]).to eq(album)
		expect(albums[1]).to eq(album2)
		expect(albums[2]).to eq(album3)
		expect(albums[3]).to eq(album4)
		expect(albums[4]).to eq(album5)
	end

end
