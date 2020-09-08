class CustomerAddress

  include ActiveModel::Model
  attr_accessor :postal_code,:region_id, :city,:number, :building_name, :phone_number,:item_id, :token, :user_id
  
  validates :postal_code,:region_id, :city,:number, :phone_number, :token, presence: true

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :region_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :phone_number, format: {with: /\A[0-9]{11}\z/}

  def save
    item = Item.find(params[:id])
    user = item.user
    Address.create(postal_code: postal_code, region_id: region_id, city: city, number: number, building_name: building_name, phone_number: phone_number, )
    Customer.create(item_id: item_id, user_id: user_id)
  end
end