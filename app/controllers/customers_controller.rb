class CustomersController < ApplicationController
  before_action :move_to_index

  def done
    @item_customer = Item.find(params[:id])
    @item_customer.update(customer_id: current_user.id)
  end

  def index
    @item = Item.find(params[:id])
  end

  def move_to_index
    item = Item.find(params[:id])
    if item.customer_id.present?
      redirect_to root_path
    end
    if current_user == item.user
      redirect_to root_path
    end
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
