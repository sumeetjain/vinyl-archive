require 'rails_helper'

RSpec.describe Artist, type: :model do
  
  let!(:artist) { Artist.create(name: "Bright Eyes", city: "Omaha", bio: "This is the biography. That is all.", url: "brighteyes.com") }
	let!(:album) { Album.create(artist_id: artist.id, name: "Big Kahuna", genre: "Rock", release_date: "2008-20-04") }
	let!(:album2) { Album.create(artist_id: artist.id, name: "Another One", genre: "Rock", release_date: "2008-20-04") }
	let!(:musician1) { Musician.create(artist_id: artist.id, name: "James Biggins", instrument: "Piano") }
	let!(:musician2) { Musician.create(artist_id: artist.id, name: "Bugs Bunny", instrument: "Guitar") }
	let!(:musician3) { Musician.create(artist_id: artist.id, name: "Roger That", instrument: "Drums") }
  
  def visit_artist(album)
  	visit "/albums"
  	within "#album_#{album.id}" do
  		click_link "Details"
  	end
  	click_link "Bright Eyes"
  end

  describe "Viewing Artist Details" do

  	it "Artist name and biography are displayed" do
  		visit_artist(album)

  		expect(page).to have_content(artist.name)
  		expect(page).to have_content(artist.bio)
  	end

  	it "Musicians and their instruments belonging to the Artist are displayed" do
  		visit_artist(album)

  		expect(page).to have_content(musician1.instrument)
  		expect(page).to have_content(musician1.name)
  		expect(page).to have_content(musician2.name)
  		expect(page).to have_content(musician3.instrument)
  	end

  	it "All albums by Artist are shown" do
  		visit_artist(album)

  		expect(page).to have_content(album.name)
  		expect(page).to have_content(album2.name)
  	end

  	it "Link to edit artist renders admin console" do
  		visit_artist(album)
  		click_link "Edit"

  		expect(page).to have_content("Edit Artist ##{artist.id}")
  		expect(page).to have_link("Users")
  	end
  end
  
end
