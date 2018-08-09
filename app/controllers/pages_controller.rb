class PagesController < ApplicationController

	def index
		@albums = Album.order("created_at desc").limit(3)
	end
	
end