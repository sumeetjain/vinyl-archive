require 'rails_helper'
include ActionView::Helpers::UrlHelper

describe 'Album City Filter' do

	let! (:artist) {Artist.create(name: "Big Kahuna", city: "Omaha")}
	let! (:artist5) {Artist.create(name: "Yep This Is Great", city: "Lincoln")}
	let! (:artist6) {Artist.create(name: "Oh My Jish", city: "Beatrice")}

	let! (:album) {Album.create(name: "Lil Kahuna", artist_id: Artist.where("name = ?", "Big Kahuna")[0].id)}
	let! (:album2) {Album.create(name: "Med Kahuna", artist_id: Artist.where("name = ?", "Yep This Is Great")[0].id)}
	let! (:album3) {Album.create(name: "Ok Here We Go", artist_id: Artist.where("name = ?", "Oh My Jish")[0].id)}
	let! (:album4) {Album.create(name: "Do it already", artist_id: Artist.where("name = ?", "Big Kahuna")[0].id)}
	let! (:album5) {Album.create(name: "Just Another Album", artist_id: Artist.where("name = ?", "Yep This Is Great")[0].id)}

	it 'Shows albums by city no filter' do
		visit(root_path)
		expect(current_path).to eq(root_path)
		page.should have_content("Omaha")
		page.should have_content("Lincoln")
		page.should have_content("Beatrice")
	end	

	it 'Shows albums by city Omaha' do
		visit(root_path)
		click_link("Omaha")
		page.should have_content("Lil Kahuna")
		page.should have_content("Do it already")
		page.should have_no_content("Med Kahuna")

	end	

	it 'Shows albums by city Lincoln' do
		visit(root_path)
		click_link("Lincoln")
		page.should have_content("Med Kahuna")
		click_link("All Cities")
		page.should have_content("Omaha")
	end	

	it 'Shows albums by city Beatrice' do
		visit('/?city=Beatrice')
		page.should have_content("Ok Here We Go")
	end

end