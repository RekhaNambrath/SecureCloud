class RemovesChangesToRequestMessages < ActiveRecord::Migration
  def change
  	remove_column :request_messages, :file_uploads_id
  	remove_column :request_messages, :file_upload
  end
end
