class CustomersController < ApplicationController
  # before_action :move_to_index

  def done
    @item_customer = Item.find(params[:id])
    @item_customer.update(customer_id: current_user.id)
  end

  def index
    @item = Item.find(params[:id])
    @customer_address = CustomerAddress.new
  end

  def new
    @customer_address = CustomerAddress.new
  end

  def create
    @item = Item.find(params[:id])
    @customer_address = CustomerAddress.new(customer_params)
    if @customer_address.valid?
      pay_item
      @customer.save
      return redirect_to root_path
    else
      render "index"
    end
  end

  private

  def customer_params
    params.require(:customer_address).permit(:postal_code,:region_id, :city,:number, :building_name, :phone_number, :token)
  end

  def pay_item
    @item = Item.find(params[:id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  # def move_to_index
  #   @item = Item.find(params[:id])
  #   if @item.customer_id.present?
  #     redirect_to root_path
  #   end
  #   if current_user == @item.user
  #     redirect_to root_path
  #   end
  #   unless user_signed_in?
  #     redirect_to root_path
  #   end
  # end
end
