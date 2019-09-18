class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_comment, only: [:edit, :update, :show, :destroy]
	before_action :set_campaign


	def new
		@comment=Comment.new
	end

	def create
		@comment = @campaign.comments.create(params[:comment].permit(:reply,:campaign_id))
		@comment.user = current_user

		respond_to do |format|
			if @comment.save
				format.html {redirect_to campaign_path(@campaign)}
				#format.js
			else
				format.html {redirect_to campaign_path(@campaign), notice:"Comment was saved"}
				#format.js
			end
		end
	end

	def destroy
		@comment = @campaign.comments.find(params[:id])
		if @comment.user == current_user
			@comment.destroy
			redirect_to campaign_path(@campaign)
		else
			redirect_to campaign_path(@cmpaign), danger: 'Нет доступа'
		end
	end

	private

	def set_campaign
		@campaign = Campaign.find(params[:campaign_id])
	end


	def set_comment
		@comment = Comment.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:reply)
	end
end
