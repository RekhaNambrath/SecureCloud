class AddFilesToRequestMessages < ActiveRecord::Migration
  def change
    add_reference :request_messages, :user, index: true, foreign_key: true
    add_reference :request_messages, :file_upload, index: true, foreign_key: true
  end
end
