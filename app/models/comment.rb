class Comment < ActiveRecord::Base
	belongs_to :essay
	belongs_to :user
end
