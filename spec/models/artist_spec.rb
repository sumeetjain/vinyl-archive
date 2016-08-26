require 'rails_helper'

RSpec.describe Artist, type: :model do
  
	let! (:artist) {Artist.create(name: "A new band", bio: "We Rock", city: "Omaha", url: "http://www.google.com")}
	let! (:artist2) {Artist.create(name: "A brand new band", bio: "We Really Rock", city: "Lincoln", url: "http://www.google.com")}
	let! (:artist3) {Artist.create(name: "The cool Band", bio: "We are so cool", city: "Beatrice", url: "http://www.google.com")}

	let! (:album) {Album.create(name: "Big Kahuna", genre: "Rock", artist_id: Artist.where("name = ?", "A new band")[0].id)}
	let! (:album2) {Album.create(name: "Red Rocket", genre: "Blues", artist_id: Artist.where("name = ?", "A new band")[0].id)}
	let! (:album3) {Album.create(name: "Dance Dance!", genre: "Electronic", artist_id: Artist.where("name = ?", "A brand new band")[0].id)}
	let! (:album4) {Album.create(name: "Millenium", genre: "Electronic", artist_id: Artist.where("name = ?", "The cool Band")[0].id)}
	let! (:album5) {Album.create(name: "Later", genre: "Electronic", artist_id: Artist.where("name = ?", "A new band")[0].id)}
	let! (:album6) {Album.create(name: "Old School", genre: "Electronic", artist_id: Artist.where("name = ?", "A brand new band")[0].id)}

 
	it 'Grabs albums by city and their count' do
		array_of_cities = Album.list_of_locations
		hash_of_city_albums_count = Album.count_of_albums_per_city		
		albums_for_Omaha = Album.get_albums_by_city("Omaha")
		albums_for_Lincoln = Album.get_albums_by_city("Lincoln")
		albums_for_Beatrice = Album.get_albums_by_city("Beatrice")

		expect(array_of_cities.size).to eq(3)
		expect(hash_of_city_albums_count['Omaha']).to eq(3)
		expect(hash_of_city_albums_count['Lincoln']).to eq(2)
		expect(hash_of_city_albums_count['Beatrice']).to eq(1)
		expect(albums_for_Omaha.size).to eq(3)
		expect(albums_for_Lincoln.size).to eq(2)
		expect(albums_for_Beatrice.size).to eq(1)
		end

end
