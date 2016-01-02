class Essay < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :category_essayships
	has_many :categorys,:through=>:category_essayships

    has_many :likes
    has_many :like_users,:through=>:likes,:source=>:user

    has_many :subsciptions
    has_many :subsciption_users,:through=>:subsciptions,:source=>:user
   def find_my_like(u)
     if u
       self.likes.where( :user_id => u.id ).first
     else
       nil
     end
   end
end
