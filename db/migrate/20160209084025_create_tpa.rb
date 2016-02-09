class CreateTpa < ActiveRecord::Migration
  def change
    create_table :tpas do |t|
    	t.string :file_hash
    end
  end
end
