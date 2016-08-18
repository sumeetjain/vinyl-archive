require 'rails_helper'

RSpec.describe Album, type: :model do

	let! (:album) {Album.create(name: "Big Kahuna", genre: "Rock", format: "LP", release_date: Date.new(2009))}
	let! (:album2) {Album.create(name: "Red Rocket", genre: "Blues", format: "EP", release_date: Date.new(1999))}
	let! (:album3) {Album.create(name: "Dance Dance!", genre: "Electronic", format: "Single", release_date: Date.new(2011))}
	let! (:album4) {Album.create(name: "Millenium", genre: "Electronic", format: "LP", release_date: Date.new(2000))}
	let! (:album5) {Album.create(name: "Later", genre: "Electronic", format: "EP", release_date: Date.new(2010))}
	let! (:album6) {Album.create(name: "Old School", genre: "Electronic", format: "Single", release_date: Date.new(1980))}

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

	it 'filters by format' do
		visit '/albums'

		click_link 'LP'
		page.should have_content('Big Kahuna')
		page.should have_content('Millenium')
		page.should have_no_content('Red Rocket')
		page.should have_no_content('Old School')

		click_link 'EP'
		page.should have_content('Red Rocket')
		page.should have_content('Later')
		page.should have_no_content('Big Kahuna')
		page.should have_no_content('Old School')

		click_link 'Single'
		page.should have_content('Dance Dance!')
		page.should have_content('Old School')
		page.should have_no_content('Red Rocket')
		page.should have_no_content('Later')
	end
  
end
