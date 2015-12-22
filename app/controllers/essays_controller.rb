class EssaysController < ApplicationController

	def index
 		@essays=Essay.all
	end
end
