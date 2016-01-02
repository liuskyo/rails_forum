class AddCountsToEssay < ActiveRecord::Migration
  def change
  	add_column :essays,:counts,:integer
  end
end
