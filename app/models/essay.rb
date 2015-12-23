class Essay < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :category_essayships
	has_many :categorys,:through=>:category_essayships
end
