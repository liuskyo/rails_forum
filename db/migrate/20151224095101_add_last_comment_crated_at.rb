class AddLastCommentCratedAt < ActiveRecord::Migration
  def change
  	add_column :essays,:lastcomment_cratedat,:datetime
  end
end
