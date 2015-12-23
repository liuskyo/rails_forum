class EssayCommentsController < ApplicationController
	
	

	def create
		@essay=Essay.find(params[:essay_id])
		@comment=@essay.comments.build(comment_params)
		@comment.user=current_user
		if @comment.save
			redirect_to essay_path(@essay)
		else
			render redirect_to essay_path(@essay)
		end
	end


	def edit
		@essay=Essay.find(params[:essay_id])
		@comment=@essay.comments.find(params[:id])
	end

	def update
		@essay=Essay.find(params[:essay_id])
		@comment=@essay.comments.find(params[:id])
		if @comment.update(comment_params)
			redirect_to essay_path(@essay)
		else
		   render :action=>"edit"
		end

	end	

	def destroy
		@essay=Essay.find(params[:essay_id])
		@comment=@essay.comments.find(params[:id])
		@comment.destroy
		redirect_to essay_path(@essay)
	end



private
	def comment_params
		params.require(:comment).permit(:content)
		
	end



end