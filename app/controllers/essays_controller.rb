class EssaysController < ApplicationController

	def index
 		@essays=Essay.all
	end

	def show
		@essay=Essay.find(params[:id])
		
	end































end
