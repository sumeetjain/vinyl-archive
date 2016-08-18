require 'rails_helper'

RSpec.describe Musician, type: :model do

	let!(:artist) { Artist.create(name: "Bright Eyes", city: "Omaha", bio: "This is the biography. That is all.", url: "brighteyes.com") }
	let!(:album) { Album.create(artist_id: artist.id, name: "Big Kahuna", genre: "Rock", release_date: "2008-20-04") }
	let!(:album2) { Album.create(artist_id: artist.id, name: "Another One", genre: "Rock", release_date: "2008-20-04") }
	let!(:musician1) { Musician.create(artist_id: artist.id, name: "James Biggins", instrument: "Piano") }
  
  def visit_musician(album)
  	visit "/albums"
  	within "#album_#{album.id}" do
  		click_link "Details"
  	end
  	click_link "Bright Eyes"
  end

  describe "Viewing an individual musician" do

  	it "Finds a link from artist page for musician" do
  		visit_musician(album)

  		expect(page).to have_content(artist.name)
  		expect(page).to have_link("James Biggins")
  	end

  	it "Musician link leads to individual musician view" do
  		visit_musician(album)
  		click_link "James Biggins"

  		expect(page).to have_content(musician1.name)
  		expect(page).to have_link("Back")
  	end

  	it "Shows all albums from musician on individual musician view" do
  		visit_musician(album)
  		click_link "James Biggins"

  		expect(page).to have_link(album.name)
  		expect(page).to have_link(album2.name)
  	end

  	it "Displays a link for Admin to edit musician" do
  		visit_musician(album)
  		click_link "James Biggins"
  		click_link "Edit"

  		expect(page).to have_link("Users")
  		expect(page).to have_content("Edit Musician ##{musician1.id}")
  	end

  end
end