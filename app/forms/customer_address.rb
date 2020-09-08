class CustomerAddress

  include ActiveModel::Model
  attr_accessor :postal_code,:region_id, :city,:number, :building_name, :phone_number,:customer_id, :token
  
  validates :postal_code,:region_id, :city,:number, :phone_number,:customer_id, :token, presence: true

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :region_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :phone_number, format: {with: /\A[0-9]{11}\z/}

  def save
    Address.create(postal_code: postal_code, region_id: region_id, city: city, number: number, building_name: building_name, phone_number: phone_number)
  end
end