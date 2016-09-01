class SearchController < ApplicationController

	def index

	end

	def show
		@albums = Search.keywordSearch(params[:id])
	end

end
