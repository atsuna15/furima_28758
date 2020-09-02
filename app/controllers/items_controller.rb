class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @user = @item
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :content, :price, :category_id, :day_id, :delivery_price_id, :region_id, :status_id).merge(user_id: current_user.id)
  end
end
