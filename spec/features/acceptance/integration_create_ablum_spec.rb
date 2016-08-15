require "rails_helper"

RSpec.describe Album, type: :model do

  def add_an_album(options)
    :album_name = options[:name]
    :artist_name = options[:artist_name]
    visit "/albums"
    click_link "Add An Album"
    fill_in "Album Title", with: options[:name]
    fill_in "Artist Name(s)", with: options[:artist_name]
    click_button "Create Album"
  end

  describe "Add a new album" do

    it "creates a new album by filling out the form" do
      add_an_album
    end
end