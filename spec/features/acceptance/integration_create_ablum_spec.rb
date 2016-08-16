require "rails_helper"

RSpec.describe Album, type: :model do

  def fill_out_album_form(options={})

    visit "/albums"
    click_link "Add An Album"
    
    fill_in "Album Title", with: options[:name]
    fill_in "Genre", with: options[:genre]

    select options[:format], from: "Format"

    click_button "Create Album"
  end

  describe "Add a new album" do

    it "Saves new album details" do
      options = {name: "Best Beats", genre: "Rock", format: "LP"}
      fill_out_album_form(options)

      expect(page).to have_content("Best Beats")
    end
  end

end