require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

	describe "GET #index" do
	    it "Returns HTTP success when visiting index" do
			get :index
			expect(response).to have_http_status(:success)
	    end

		it "Creates new instance for all albums" do
			all_albums = Album.all

			get :index
			assigns(:albums).should eq(all_albums)
		end
	end

end