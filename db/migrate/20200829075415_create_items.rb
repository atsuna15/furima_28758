class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.string :image,              null: false
      t.text :content,              null: false
      t.integer :price,             null: false
      t.integer :category_id,       null: false
      t.integer :status_id,         null: false
      t.integer :delivery_price_id, null: false
      t.integer :region_id,         null: false
      t.integer :day_id,            null: false
      t.integer :user_id,           foreign_key: true
      t.timestamps
    end
  end
end
