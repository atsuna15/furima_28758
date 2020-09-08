class CustomerAddress

  include ActiveModel::Model
  attr_accessor :postal_code,:region_id, :city,:number, :building_name, :phone_number,:customer_id, :token
  
  validates :postal_code,:region_id, :city,:number, :building_name, :phone_number,:customer_id, :token, presence: true
  

  def save
    Address.create(postal_code: postal_code, region_id: region_id, city: city, number: number, building_name: building_name, phone_number: phone_number)
  end
end