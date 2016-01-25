class CreateRequestMessages < ActiveRecord::Migration
  def change
    create_table :request_messages do |t|
      t.boolean :update
      t.boolean :audit
      t.integer :user_id
      t.integer :file_id
      t.string :file_hash

      t.timestamps null: false
    end
  end
end
