class Category < ActiveRecord::Base
	has_many :category_essayships
	has_many :essays,:through=>:category_essayships
end
