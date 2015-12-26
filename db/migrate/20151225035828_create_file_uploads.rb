class CreateFileUploads < ActiveRecord::Migration
  def change
    create_table :file_uploads do |t|
      t.string :fname
      t.string :owner
      t.string :ftype
      t.text :keywords
      t.string :attachment

      t.timestamps null: false
    end
  end
end
