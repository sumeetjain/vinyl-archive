require 'rails_helper'

RSpec.describe Photo, type: :model do
  
  	let! (:artist) {Artist.create(:name=>"New Band", :city=>"Fremont", :url=>"fake.jpg", :bio=>"cool guys")}
  	let! (:album) {Album.create(artist_id: artist.id, name: "Big Kahuna", genre: "Rock", format: "LP", release_date: Date.new(2009))}

	let! (:artist2) {Artist.create(:name=>"Zephyrs", :city=>"Nickerson", :url=>"fake.jpg", :bio=>"cool guys")}
  	let! (:album2) {Album.create(artist_id: artist2.id, name: "Red Rocket", genre: "Blues", format: "EP", release_date: Date.new(1999))}

  	let! (:photo) {Photo.create(the_photo: "Photo1.jpg", album_id: Album.find_by(name: "Big Kahuna").id)}
  	let! (:photo2) {Photo.create(the_photo: "Photo2.jpg", album_id: Album.find_by(name: "Big Kahuna").id)}
  	let! (:photo3) {Photo.create(the_photo: "Photo3.jpg", album_id: Album.find_by(name: "Big Kahuna").id)}
  	let! (:photo4) {Photo.create(the_photo: "Photo4.jpg", album_id: Album.find_by(name: "Red Rocket").id)}
  	let! (:photo5) {Photo.create(the_photo: "Photo5.jpg", album_id: Album.find_by(name: "Red Rocket").id)}

  	it 'Photos are saved where they should' do

  		expect(photo.album_id).to eq(album.id)
  		expect(photo2.album_id).to eq(photo.album_id)
  		expect(photo5.album_id).to eq(album2.id)
  		expect(photo5.album_id).not_to eq(photo3.id)

  	end	

end
