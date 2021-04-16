class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_description, :product_category_id, :product_status_id,
                                 :shipping_fee_burden_id, :shipping_area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
