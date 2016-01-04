class Essay < ActiveRecord::Base

  # TODO: validations
  
	belongs_to :user

	has_many :comments
	has_many :category_essayships
	has_many :categorys,:through=>:category_essayships

  has_many :likes,:dependent => :destroy
  has_many :like_users,:through=>:likes,:source=>:user

  has_many :subscriptions,:dependent => :destroy
  has_many :subscription_users,:through=>:subscriptions,:source=>:user

  def find_my_like(u)
    if u
      self.likes.where( :user_id => u.id ).first
    else
      nil
    end
  end

  def find_my_subscription(u)
     if u
       self.subscriptions.where( :user_id => u.id ).first
     else
       nil
     end
  end

end
