class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commentable, :polymorphic => true
      t.integer :author_id
      t.string :subject
      t.text :content
      t.integer :votes, :default => 0, :null => false
      t.timestamps
    end
    
    add_index :comments, [:commentable_type, :commentable_id]
    add_index :comments, :author_id
  end
end
