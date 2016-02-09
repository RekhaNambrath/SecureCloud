class CreateTpaCsps < ActiveRecord::Migration
  def change
    create_table :tpa_csps do |t|
      t.integer :status_code
      t.string :file_hash

      t.timestamps null: false
    end
  end
end
