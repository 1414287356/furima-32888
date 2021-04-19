class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @items = Item.all.order("id DESC")
  end

  def show
    @item = Item.find(params[:id])
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
