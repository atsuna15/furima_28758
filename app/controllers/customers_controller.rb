class CustomersController < ApplicationController
  before_action :set_customer, only: [:index, :create, :pay_item, :move_to_index]
  before_action :set_customer_address, only: [:index, :new]
  before_action :move_to_index

  def index
  end

  def new
  end

  def create
    @customer_address = CustomerAddress.new(customer_params)
    if @customer_address.valid?
      pay_item
      @customer_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def customer_params
    params.permit(:postal_code, :region_id, :city, :number, :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: customer_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if unless user_signed_in?
      redirect_to new_user_session_path
      end
    elsif @item.customer
        redirect_to root_path
    elsif current_user == @item.user
        redirect_to root_path
    end
  end

  def set_customer
    @item = Item.find(params[:item_id])
  end

  def set_customer_address
    @customer_address = CustomerAddress.new
  end
end
