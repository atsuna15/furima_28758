class AddDetailToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :familiy_name, :string
    add_column :users, :first_name, :string
    add_column :users, :family_name_k, :string
    add_column :users, :first_name_k, :string
    add_column :users, :birth, :date
  end
end
