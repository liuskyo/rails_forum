class CreateCategoryEssayships < ActiveRecord::Migration
  def change
    create_table :category_essayships do |t|
      t.string :essay_id
      t.string :category_id

      t.timestamps null: false
    end
    add_index :category_essayships,:essay_id
    add_index :category_essayships,:category_id
  end
end
