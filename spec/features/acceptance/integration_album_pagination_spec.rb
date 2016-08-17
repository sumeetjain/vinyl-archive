require 'rails_helper'

RSpec.describe Album, type: :model do
	let!(:album) { Album.create(name: "Big Kahuna", genre: "Rock", release_date: "2008-20-04") }
	let!(:album2) { Album.create(name: "Red Rocket", genre: "Blues", release_date: "2007-05-01") }
	let!(:album3) { Album.create(name: "Dance Dance!", genre: "Electronic", release_date: "2011-13-10") }
	let!(:album4) { Album.create(name: "Holy Cow!", genre: "Country", release_date: "2006-09-10") }
	let!(:album5) { Album.create(name: "Black Rabbit", genre: "Blues", release_date: "2002-10-01") }
	let!(:album6) { Album.create(name: "DHHT", genre: "Electronic", release_date: "2001-13-10") }
	let!(:album7) { Album.create(name: "Weeping Willows", genre: "Country", release_date: "2006-09-10") }
	let!(:album8) { Album.create(name: "Hampton Park", genre: "Blues", release_date: "2002-10-01") }
	let!(:album9) { Album.create(name: "BOOM!", genre: "Electronic", release_date: "2011-13-10") }

	describe "Album Pagination" do

		it "Finds numbered pagination Links on /albums page" do
			visit "/albums"

			expect(page).to have_link("2")
			expect(page).to have_link("3")
		end

		it "Finds 'next' and 'last' links on /albums page" do
			visit "/albums"

			expect(page).to have_link("Next")
			expect(page).to have_link("Last")
		end

		it "Finds 'prev' and 'first' links on /albums page" do
			visit "/albums"
			click_link "Next"

			expect(page).to have_link("Prev")
			expect(page).to have_link("First")
		end
	end

end