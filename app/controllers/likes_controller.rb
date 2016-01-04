class LikesController < ApplicationController
  before_action :set_essay
  before_action :authenticate_user!, :except => [:index, :show]
 
   # like
   def create
     Like.create!( :essay => @essay, :user => current_user )
 
     redirect_to :back
   end
 
   # unlike
   def destroy
     like = current_user.likes.find( params[:id] )
     like.destroy
 
     redirect_to :back
   end
 
end
