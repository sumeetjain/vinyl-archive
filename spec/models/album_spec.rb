require 'rails_helper'

RSpec.describe Album, type: :model do

	let! (:album) {Album.create(name: "Big Kahuna", genre: "Rock", release_date: Date.new(2009))}
	let! (:album2) {Album.create(name: "Red Rocket", genre: "Blues", release_date: Date.new(1999))}
	let! (:album3) {Album.create(name: "Dance Dance!", genre: "Electronic", release_date: Date.new(2011))}
	let! (:album4) {Album.create(name: "Millenium", genre: "Electronic", release_date: Date.new(2000))}
	let! (:album5) {Album.create(name: "Later", genre: "Electronic", release_date: Date.new(2010))}
	let! (:album6) {Album.create(name: "Old School", genre: "Electronic", release_date: Date.new(1980))}

	it 'sorts by decade' do
		albums = Album.all
		eighties = Album.timeframe(albums, 1980, 1989)
		nineties = Album.timeframe(albums, 1990, 1999)
		aughts = Album.timeframe(albums, 2000, 2009)
		teens = Album.timeframe(albums, 2010, 2019)
		binding.pry
	end
  
end
