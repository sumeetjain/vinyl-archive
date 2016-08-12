require 'rails_helper'

RSpec.describe Album, type: :model do
	describe "All Albums" do
		it "Finds complete list of album titles" do
			visit("/albums")
			expect(page).to have_content("All Albums")
			expect(page).to have_content("Title")
		end
	end
end
