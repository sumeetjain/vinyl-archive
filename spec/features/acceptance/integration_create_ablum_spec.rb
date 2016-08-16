require "rails_helper"

RSpec.describe Album, type: :model do

  def fill_out_album_form(options={})

    visit "/albums"
    click_link "Add An Album"
    fill_in "Album title", with: options[:name]
    fill_in "Genre", with: options[:genre]
    fill_in "Release Date", with: options[:release_date]
    fill_in "Format", with: options[:format]
    click_button "Create Album"
  end

  describe "Add a new album" do

    it "Saves new album details" do
      options = {name: "Best Beats", genre: "Rock", release_date: Date.new, format: "LP"}
      fill_out_album_form(options)

      expect(page).to have_content("Best Beats")
    end
  end
end