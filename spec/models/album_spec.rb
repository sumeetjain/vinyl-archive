require 'rails_helper'

RSpec.describe Album, type: :model do

	let! (:album) {Album.create(artist_id: artist.id, name: "Big Kahuna", genre: "Rock", format: "LP", release_date: Date.new(2009))}
	let! (:album2) {Album.create(artist_id: artist2.id, name: "Red Rocket", genre: "Blues", format: "EP", release_date: Date.new(1999))}
	let! (:album3) {Album.create(artist_id: artist3.id, name: "Dance Dance!", genre: "Electronic", format: "Single", release_date: Date.new(2011))}
	let! (:album4) {Album.create(artist_id: artist2.id, name: "Alpha", genre: "Electronic", format: "LP", release_date: Date.new(2000))}
	let! (:album5) {Album.create(artist_id: artist.id, name: "Zeta", genre: "Electronic", format: "EP", release_date: Date.new(2010))}
	let! (:album6) {Album.create(name: "Old School", genre: "Electronic", format: "Single", release_date: Date.new(1980))}

	let! (:artist) {Artist.create(:name=>"New Band", :city=>"Fremont", :url=>"fake.jpg", :bio=>"cool guys")}
	let! (:artist2) {Artist.create(:name=>"Zephyrs", :city=>"Nickerson", :url=>"fake.jpg", :bio=>"cool guys")}
	let! (:artist3) {Artist.create(:name=>"Agnostics", :city=>"Broken Bow", :url=>"fake.jpg", :bio=>"cool guys")}
	


	it 'sorts by title' do
		albums = Album.getSortedList(Album.all, "title")
		expect(albums[0]).to eq(album4)
		expect(albums[1]).to eq(album)
		expect(albums[2]).to eq(album3)
		expect(albums[3]).to eq(album6)
		expect(albums[4]).to eq(album2)
		expect(albums[5]).to eq(album5)
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
		Album.create(artist_id: artist.id, name: "Aardvark", genre: "Electronic", release_date: "2011")
		albums = Album.getSortedList(Album.all, "title")
		albums = Album.getSortedList(albums, "date")
		expect(albums[0]).to eq(album)
		expect(albums[1]).to eq(album2)
		expect(albums[2]).to eq(album3)
		expect(albums[3]).to eq(album4)
		expect(albums[4]).to eq(album5)
	end

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
		page.should have_content('Alpha')
		page.should have_no_content('Red Rocket')
		page.should have_no_content('Old School')
		page.should have_no_content('Zeta')
		page.should have_no_content('Dance Dance!')

		click_link 'EP'
		page.should have_content('Red Rocket')
		page.should have_content('Zeta')
		page.should have_no_content('Big Kahuna')
		page.should have_no_content('Old School')
		page.should have_no_content('Alpha')
		page.should have_no_content('Dance Dance!')

		click_link 'Single'
		page.should have_content('Dance Dance!')
		page.should have_content('Old School')
		page.should have_no_content('Red Rocket')
		page.should have_no_content('Zeta')
		page.should have_no_content('Big Kahuna')
		page.should have_no_content('Alpha')

		Album.delete_all
		click_link 'LP'
		page.should have_no_content('Details')
		click_link 'EP'
		page.should have_no_content('Details')
		click_link 'Single'
		page.should have_no_content('Details')

	end
  
end
