class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.string :user_id
      t.string :essay_id
      t.text :content	
      t.timestamps null: false
    end
    add_index :comments,:user_id
    add_index :comments,:essay_id
  end
end
