class DeleteColumnsToRequestMessages < ActiveRecord::Migration
  def change
  	add_column :request_messages, :status_code, :integer
  end
end
