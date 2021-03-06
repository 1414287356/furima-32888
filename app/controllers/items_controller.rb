class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, except: [:index, :show, :create, :new]
  after_action :move_to_root_path_2, only: [:edit, :update]

  def index
    @items = Item.all.order('id DESC')
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
    redirect_to root_path unless @item.purchase_record.nil?
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  def update
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

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product_name, :product_description, :product_category_id, :product_status_id,
                                 :shipping_fee_burden_id, :shipping_area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def move_to_root_path_2
    redirect_to root_path unless @item.purchase_record.nil?
  end
end
