class AddTpaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tpa, :boolean, default: false
  end
end
