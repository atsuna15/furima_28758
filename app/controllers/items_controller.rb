class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :content, :price, :category_id, :day_id, :delivery_price_id, :region_id, :status_id).merge(user_id: current_user.id)
  end
end
