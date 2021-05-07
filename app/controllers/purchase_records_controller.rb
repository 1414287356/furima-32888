class PurchaseRecordsController < ApplicationController
before_action :set_item, only: [:create, :index]
before_action :authenticate_user!
before_action :move_to_root_path, only: :index
before_action :move_to_root_path

  def index
    @form = Form.new
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    if @form.valid?
      pay_item
      @form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: form_params[:token],
      currency: 'jpy'
    )
  end

  def form_params
    params.require(:form).permit(:postal_code, :shipping_area_id, :municipalities, :address, :building, :phone_number, :purchase_record).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_root_path
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def move_to_root_path
    if @item.purchase_record != nil
      redirect_to root_path
    end
  end
end
