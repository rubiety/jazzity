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
  end
end
