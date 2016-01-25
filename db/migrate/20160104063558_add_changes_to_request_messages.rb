class AddChangesToRequestMessages < ActiveRecord::Migration
  def change
    remove_column :request_messages, :user_id
    remove_column :request_messages, :file_id
  end
end
