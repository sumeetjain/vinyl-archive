require "rails_helper"

RSpec.describe Album, type: :model do

  let!(:album1){ {name: "Best Beats", genre: "Rock", format: "LP"} }
  let!(:artist){ {name: "Bright Eyes", city: "Omaha", bio: "This is the biography. That is all.", url: "brighteyes.com"} }
  let!(:musician1){ {name: "Jack Crawford", instrument: "Guitar"} }
  let!(:musician2){ {name: "Dag Hanson", instrument: "Bass"} }
  let!(:musician3){ {name: "Allen Johnson", instrument: "Drums"} }

  def fill_out_album_form(album1={})
    visit "/albums/new"
    fill_in "album[name]", with: album1[:name]
    fill_in "album[genre]", with: album1[:genre]
    select album1[:format], from: "album[format]"
  end

  def fill_out_artist_form(artist={})
    visit "/albums/new"
    fill_in "album[artist_attributes][name]", with: artist[:name]
    fill_in "album[artist_attributes][city]", with: artist[:city]
    fill_in "album[artist_attributes][bio]", with: artist[:bio]
    fill_in "album[artist_attributes][url]", with: artist[:url]
  end

  def fill_out_musician_form(musician={}, i)
    visit "/albums/new"
    fill_in "album[artist_attributes][musicians_attributes][#{i}][name]", with: musician[:name]
    fill_in "album[artist_attributes][musicians_attributes][#{i}][instrument]", with: musician[:instrument]     
  end

  describe "Add Album details when creating a new album" do

    it "Saves new album details" do
      fill_out_album_form(album1)
      click_button "Create Album"

      expect(page).to have_content("Best Beats")
      expect(page).to have_content("Rock")
      expect(page).to have_content("LP")
    end

    it "Redirects to Add An Album page" do
      visit "/albums"
      click_link "Add An Album"

      expect(page).to have_content("Album title")
    end
  end

  describe "Add Artist when creating new album" do

    it "Save new artist details" do
      fill_out_artist_form(artist)
      click_button "Create Album"

      expect(page).to have_content("Bright Eyes")
      expect(page).to have_content("Omaha")
      expect(page).to have_content("This is the biography. That is all.")
      expect(page).to have_content("brighteyes.com")
    end
  end

  describe "Add Musicians when creating new album" do

    it "Saves 1 new musician's details" do
      fill_out_artist_form(artist)
      fill_out_musician_form(musician1, 0)
      click_button "Create Album"

      click_link "Bright Eyes"

      expect(page).to have_content("Trumpet")
    end

    it "Saves 3 new musicians' details" do
      fill_out_artist_form(artist)
      fill_out_album_form(album1)

      fill_out_musician_form(musician1, 0)
      fill_out_musician_form(musician2, 1)
      fill_out_musician_form(musician3, 2)

      click_button "Create Album"
      click_link "Bright Eyes"

      expect(page).to have_content("Jack Crawford")
      expect(page).to have_content("Dag Hanson")
      expect(page).to have_content("Bass")
      expect(page).to have_content("Allen Johnson")
      expect(page).to have_content("Drums")

    end
  end

end