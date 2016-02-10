class AddFileUploadsToTpa < ActiveRecord::Migration
  def change
  	add_reference :tpas, :file_upload, index: true, foreign_key: true
  end
end
