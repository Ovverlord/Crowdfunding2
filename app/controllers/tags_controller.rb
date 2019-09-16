class TagsController < ApplicationController
	def show
		@tag = Tag.find_by(name: params[:id])
		@campaigns = @tag.campaigns	
	end
end
