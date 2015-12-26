class AddHashToFileUpload < ActiveRecord::Migration
  def change
    add_column :file_uploads, :hash_val, :string, :default => ""
  end
end
