require 'rails_helper'

RSpec.describe Album, type: :model do

	let! (:album) {Album.create(name: "Big Kahuna", genre: "Rock", release_date: Date.new(2009), city: "Omaha")}
	let! (:album2) {Album.create(name: "Red Rocket", genre: "Blues", release_date: Date.new(1999), city: "Omaha")}
	let! (:album3) {Album.create(name: "Dance Dance!", genre: "Electronic", release_date: Date.new(2011), city: "Lincoln")}
	let! (:album4) {Album.create(name: "Millenium", genre: "Electronic", release_date: Date.new(2000), city: "Beatrice")}
	let! (:album5) {Album.create(name: "Later", genre: "Electronic", release_date: Date.new(2010), city: "Wahoo")}
	let! (:album6) {Album.create(name: "Old School", genre: "Electronic", release_date: Date.new(1980), city: "Lincoln")}

	it 'sorts by decade' do
		albums = Album.all
		eighties = Album.timeframe(albums, 1980, 1989)
		nineties = Album.timeframe(albums, 1990, 1999)
		aughts = Album.timeframe(albums, 2000, 2009)
		teens = Album.timeframe(albums, 2010, 2019)
		
		expect(eighties[0]).to eq(album6)
		expect(nineties[0]).to eq(album2)
		expect(aughts[0]).to eq(album)
		expect(aughts[1]).to eq(album4)
		expect(teens[0]).to eq(album3)
		expect(teens[1]).to eq(album5)
	end

	it 'Gets Albums by City' do
		@stuff Album.get_albums_by_city(params['city']


end
