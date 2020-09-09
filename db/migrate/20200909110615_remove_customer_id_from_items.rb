class RemoveCustomerIdFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :customer_id, :integer
  end
end
