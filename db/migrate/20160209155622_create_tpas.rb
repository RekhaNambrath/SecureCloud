class CreateTpas < ActiveRecord::Migration
  def change
    create_table :tpas do |t|
      t.string :file_hash

      t.timestamps null: false
    end
  end
end
