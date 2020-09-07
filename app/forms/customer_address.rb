class CustomerAddress

  include ActiveModel::Model
  attr_accessor :postal_code,:region_id, :city,:number, :building_name, :phone_number,:customer_id
  
  validates :postal_code,:region_id, :city,:number, :building_name, :phone_number,:customer_id, presence: true
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :postal_code, format: {with: /\A[0-9]{11}\z/, }

  def save
    customer = Customer.find(params[:id])
   
    Address.create(postal_code: postal_code,region_id: region_id, city: city,number: number, building_name: building_name, phone_number: phone_number, customer_id: customer.id)
  end
end