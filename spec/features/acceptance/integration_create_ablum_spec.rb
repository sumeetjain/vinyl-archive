require "rails_helper"

RSpec.describe Album, type: :model do

  def fill_out_album_form(options={})
    :name = options[:name]
    :genre = options[:genre]
    :release_date = options[:release_date]
    :format = options[:format]

    visit "/albums"
    click_link "Add An Album"
    fill_in "Album Title", with: :name
    fill_in "Genre", with: :genre
    fill_in "Release Date" with: :release_date
    fill_in "Format" with: :format
    click_button "Create Album"
  end

  describe "Add a new album" do

    it "Saves new album details" do
      options = {name: "Best Beats", genre: "Rock", release_date: Date.new, format: "LP"}
      # fill_out_album_form(options)

      visit "/albums"
      click_link "Add An Album"
      fill_in "Album Title", with: options[:name]
      fill_in "Genre", with: options[:genre]
      fill_in "Release Date" with: options[:release_date]
      fill_in "Format" with: options[:format]
      click_button "Create Album"

      expect(page).to have_content("Best Beats")
    end
  end
end