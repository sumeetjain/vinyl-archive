require 'rails_helper'

RSpec.describe Album, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  	let! (:artist) {Artist.create(:name=>"New Band", :city=>"Fremont", :url=>"fake.jpg", :bio=>"cool guys")}
  	let! (:artist2) {Artist.create(:name=>"Zephyrs", :city=>"Nickerson", :url=>"fake.jpg", :bio=>"cool guys")}
  	let! (:artist3) {Artist.create(:name=>"Agnostics", :city=>"Broken Bow", :url=>"fake.jpg", :bio=>"cool guys")}
	
	let! (:album) {Album.create(artist_id: artist.id, name: "Big Kahuna", genre: "Rock", release_date: "2008")}
	let! (:album2) {Album.create(artist_id: artist.id, name: "Red Rocket", genre: "Blues", release_date: "1999")}
	let! (:album3) {Album.create(artist_id: artist.id, name: "Dance Dance!", genre: "Electronic", release_date: "2011")}
	let! (:album4) {Album.create(artist_id: artist.id, name: "Alpha", genre: "Electronic", release_date: "2011")}
	let! (:album5) {Album.create(artist_id: artist.id, name: "Zeta", genre: "Electronic", release_date: "2011")}

end
