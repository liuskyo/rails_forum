class EssayCommentsController < ApplicationController
	
	before_action :set_essay
	before_action :authenticate_user!



	def create
		@comment = @essay.comments.build(comment_params)
		@comment.user = current_user

		if @comment.save
			@essay.comments_cont=@essay.comments_cont+1
			@essay.lastcomment_cratedat=@essay.comments.last.created_at
			@essay.save
			redirect_to essay_path(@essay)
		else
			render redirect_to essay_path(@essay)
		end
	end


	def edit
		@comment = @essay.comments.find(params[:id])
	end

	def update
		@comment = current_user.comments.find(params[:id])
		if @comment.update(comment_params)
			redirect_to essay_path(@essay)
		else
		   render :action=>"edit"
		end

	end	

	def destroy
		@comment = current_user.comments.find(params[:id])
		@comment.destroy
		@essay.comments_cont=@essay.comments_cont-1
		@essay.save

		redirect_to essay_path(@essay)
	end


	private

	def comment_params
		params.require(:comment).permit(:content)
		
	end

end