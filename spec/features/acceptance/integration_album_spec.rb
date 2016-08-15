require "rails_helper"

RSpec.describe Album, type: :model do
	let!(:album) { Album.create(name: "Big Kahuna", genre: "Rock", release_date: "2008") }
	let!(:album2) { Album.create(name: "Red Rocket", genre: "Blues", release_date: "1999") }
	let!(:album3) { Album.create(name: "Dance Dance!", genre: "Electronic", release_date: "2011") }

  def visit_album_details(album)
    visit "/"
    within "#album_#{album.id}" do
      click_link "Details"
    end
  end

  describe "All Albums" do

    it "Finds a specific album title" do
      visit("/albums")

      expect(page).to have_content("Big Kahuna")
      expect(album.genre).to eq("Rock")
      expect(album.name).to eq("Big Kahuna")
    end

    it "Finds multiple album titles" do
    	all_albums = Album.all
    	visit "/albums"
    	
    	expect(page).to have_content("Dance Dance!")
    	expect(all_albums.count).to eq(3)
    	expect(album2.release_date).to eq("1999")
    end

  end

  describe "Link to album details" do

    it "Album details show up on details page" do
      visit_album_details(album)

      expect(page).to have_content(album.name)
      expect(page).to have_content(album.release_date)
    end

    it "Link can be clicked to return to home page from details" do
      visit_album_details(album2)
      click_link "Home"

      expect(page).to have_content("All Albums")
    end
  end
end