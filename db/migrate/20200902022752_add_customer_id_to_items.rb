class AddCustomerIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :customer_id, :integer
  end
end
