class EssaysController < ApplicationController
before_action :authenticate_user!,:except=>[:index]
	def index


        if params[:cat]
            @categories=Category.find(params[:cat])
            @essays=@categories.essays
            @cat=params[:cat]
            if params[:order]
                sort_by = (params[:order] == 'comments_cont') ? 'comments_cont Desc' : 'lastcomment_cratedat'
                @essays = @essays.order(sort_by)
            end
        else
            @essays=Essay.all
            if params[:order]
                sort_by = (params[:order] == 'comments_cont') ? 'comments_cont Desc' : 'lastcomment_cratedat'
                @essays = @essays.order(sort_by)
            end
        end




        if params[:order]
            sort_by = (params[:order] == 'comments_cont') ? 'comments_cont Desc' : 'lastcomment_cratedat'
            @essays = @essays.order(sort_by)
        end

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
        @essay.comments_cont=0

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


    def about
        @users=User.all
        @comments=Comment.all
        @essays=Essay.all
    end










private
	def essay_params
		params.require(:essay).permit(:topic,:content,:category_id,:category_ids=>[])
	end





end
