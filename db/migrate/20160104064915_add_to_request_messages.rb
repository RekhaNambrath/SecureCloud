class AddToRequestMessages < ActiveRecord::Migration
  def change
  	add_reference :request_messages, :file_upload, index: true, foreign_key: true
  end
end
