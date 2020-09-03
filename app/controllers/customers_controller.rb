class CustomersController < ApplicationController
  def done
    @item_customer = Item.find(params[:id])
    @item_customer.update(customer_id: current_user.id)
  end
end
