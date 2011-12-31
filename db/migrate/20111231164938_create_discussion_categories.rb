class CreateDiscussionCategories < ActiveRecord::Migration
  def change
    create_table :discussion_categories do |t|
      t.integer :position
      t.string :name
      t.string :slug
      t.string :description
      t.string :discussable_type
      t.string :discussable_type_2
      t.timestamps
    end

    add_index :discussion_categories, :slug, :unique => true
  end
end
