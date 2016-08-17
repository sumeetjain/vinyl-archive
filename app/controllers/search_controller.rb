class SearchController < ApplicationController

	def index

	end

	def show
		@albums = Search.keywordSearch(params[:query])
	end

end
