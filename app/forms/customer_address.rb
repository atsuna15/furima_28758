class CustomerAddress
  include ActiveModel::Model
  attr_accessor :postal_code,:region_id, :city,:number, :building_name, :phone_number,:item_id, :token, :user_id, :customer_id

  validates :postal_code, :city, :number, :phone_number, :token, presence: true

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
  validates :region_id, numericality: { other_than: 1, message: "Select" }
  validates :phone_number, format: {with: /\A[0-9]{11}\z/}

  def save
    customer = Customer.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, region_id: region_id, city: city, number: number, building_name: building_name, phone_number: phone_number, customer_id: customer.id)
  end
end