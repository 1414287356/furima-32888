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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      render :show
    else
      render :edit
    end
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
