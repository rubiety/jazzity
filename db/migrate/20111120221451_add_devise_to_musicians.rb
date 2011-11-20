class AddDeviseToMusicians < ActiveRecord::Migration
  def change
    change_table(:musicians) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.confirmable
      t.token_authenticatable
    end

    add_index :musicians, :email
    add_index :musicians, :reset_password_token, :unique => true
    add_index :musicians, :confirmation_token,   :unique => true
    add_index :musicians, :authentication_token, :unique => true
  end
end
