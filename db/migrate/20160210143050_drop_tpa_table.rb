class DropTpaTable < ActiveRecord::Migration
  def change
  	drop_table :tpas
  end
end
