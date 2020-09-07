class Address < ApplicationRecord
  belongs_to :customer
  belongs_to_active_hash :region
end
