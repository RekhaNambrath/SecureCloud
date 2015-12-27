class AddUserToFileUploads < ActiveRecord::Migration
  def change
    add_reference :file_uploads, :user, index: true, foreign_key: true
  end
end
