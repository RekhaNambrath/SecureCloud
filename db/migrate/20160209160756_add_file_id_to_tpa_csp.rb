class AddFileIdToTpaCsp < ActiveRecord::Migration
  def change
  	add_reference :tpa_csps, :file_upload, index: true, foreign_key: true
  end
end
