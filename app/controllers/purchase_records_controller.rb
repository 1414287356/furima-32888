class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @form = Form.new
  end

  def new
    @form = Form.new
  end

  def create
    @item = Item.find(params[:item_id])
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
end
