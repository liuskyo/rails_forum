class Add < ActiveRecord::Migration
  def change
  	add_column :essays,:comments_cont,:integer
  end
end
