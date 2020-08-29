class Item < ApplicationRecord
  extend ActiveHash::Association::ActiveRecordExtensions
  belongs_to_active_hash :category, :day, :delivery_price, :region, :status
  belongs_to :user

  validates :name, :image, :content, :price, :category, :day, :delivery_price, :region, :status, presence: true

  validates :category_id, :day_id, :delivery_price_id, :region_id, :status_id, numericality: { other_than: 1}
end
