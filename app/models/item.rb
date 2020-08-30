class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :delivery_price
  belongs_to_active_hash :region
  belongs_to_active_hash :status
  belongs_to :user

  validates :name, :image, :content, :price, :category, :day, :delivery_price, :region, :status, presence: true

  validates :category_id, :day_id, :delivery_price_id, :region_id, :status_id, numericality: { other_than: 1}
end
