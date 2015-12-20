class AddIndexToUsersEmail < ActiveRecord::Migration
  def change #database level uniqueness for email
  	   add_index :users, :email, unique: true
  end
end
