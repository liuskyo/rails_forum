class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|

	  t.string :user_id
      t.string :topic
      t.text :content
      t.timestamps null: false
    end
    add_index :essays,:user_id
  end
end

