require "rails_helper"

RSpec.describe Album, type: :model do

  Artist.create(:name=>"New Band", :city=>"Fremont", :url=>"fake.jpg", :bio=>"cool guys")s
	Album.create(name: "Big Kahuna", genre: "Rock", release_date: "2008") 
	Album.create(name: "Red Rocket", genre: "Blues", release_date: "1999") 
	Album.create(name: "Dance Dance!", genre: "Electronic", release_date: "2011")

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
end