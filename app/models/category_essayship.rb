class CategoryEssayship < ActiveRecord::Base
	belongs_to :category
	belongs_to :essay
end
