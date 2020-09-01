class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :delivery_price
  belongs_to_active_hash :region
  belongs_to_active_hash :status
  belongs_to :user
  has_one_attached :image

  validates :name, :content, :image, :category, :day, :delivery_price, :region, :status, presence: true

  validates :category_id, :day_id, :delivery_price_id, :region_id, :status_id, numericality: { other_than: 1, message:"Select"}

  validates :price, presence: true, numericality: { with: /^[0-9]+$/, message: 'Half-width number'}, inclusion: { in: 300..9999999, message:'Out of setting range'}
end
