class EssaysController < ApplicationController

	def index
 		@essays=Essay.all
	end

	def show
		@essay=Essay.find(params[:id])
        @comments=@essay.comments
		@comment=Comment.new
	end


    def new
    	@essay=Essay.new
    end

    def create
    	@essay=Essay.new(essay_params)
    	@essay.user=current_user

    	if @essay.save
			redirect_to essays_path#tell browser http code:303
		else
			render essays_path
		end
    end

    def edit
    	@essay=Essay.find(params[:id])
    end


    def update
    	@essay=Essay.find(params[:id])
    	@essay.update(essay_params)
    	redirect_to essay_path(@essay)
    end

    def destroy
    	@essay=Essay.find(params[:id])
    	@essay.destroy
    	redirect_to essays_path
    	
    end













private
	def essay_params
		params.require(:essay).permit(:topic,:content,:category_id)
	end





end
