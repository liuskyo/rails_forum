class EssaysController < ApplicationController

  before_action :authenticate_user!,:except=>[:index]

  def index
    if params[:cat]
      @categories = Category.find(params[:cat])
      @essays = @categories.essays
    else
      @essays = Essay.all
    end

    if params[:order]
      sort_by = (params[:order] == 'comments_cont') ? 'comments_cont DESC' : 'lastcomment_cratedat'
      @essays = @essays.order(sort_by)
    end
  end

  def show
  	@essay = Essay.find(params[:id])
    @comments = @essay.comments
  	@comment = Comment.new
    
    @essay.counts = @essay.counts+1
    @essay.save
  end


  def new
  	@essay = Essay.new
  end

  def create
  	@essay = Essay.new(essay_params)
  	@essay.user = current_user
    @essay.comments_cont = 0
    @essay.counts=0

  	if @essay.save
  		redirect_to essays_path #tell browser http code:303
  	else
  		render essays_path
  	end
  end

  def edit
  	@essay = current_user.essays.find(params[:id])
  end


  def update
  	@essay = current_user.essays.find(params[:id])
  	@essay.update(essay_params)
  	redirect_to essay_path(@essay)
  end

  def destroy
  	@essay = current_user.essays.find(params[:id])
  	@essay.destroy

  	redirect_to essays_path
  end

  def about
    @users = User.all
    @comments = Comment.all
    @essays = Essay.all
  end

    # POST /topics/:id/subscribe
   def subscribe
     @essay = Essay.find( params[:id] )
     @essay.subscriptions.create!( :user => current_user )
 
     redirect_to :back
   end
 
   def unsubscribe
      @essay = Essay.find( params[:id] )
      current_user.subscriptions.where( :essay_id => @essay.id ).destroy_all
 
      redirect_to :back
   end


  private

	def essay_params
		params.require(:essay).permit(:topic,:content,:category_id,:category_ids=>[])
	end

end
