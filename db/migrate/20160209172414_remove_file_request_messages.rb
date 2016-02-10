class RemoveFileRequestMessages < ActiveRecord::Migration
  def change
  	remove_column :request_messages, :audit,:boolean
    remove_column :request_messages, :update,:boolean
  end
end
