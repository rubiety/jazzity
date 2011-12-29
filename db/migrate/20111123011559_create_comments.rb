class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commentable, :polymorphic => true
      t.integer :author_id
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.string :subject
      t.text :content
      t.timestamps
    end
    
    add_index :comments, [:commentable_type, :commentable_id]
    add_index :comments, :author_id
  end
end

