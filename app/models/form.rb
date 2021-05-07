class Form 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :shipping_area_id, :municipalities, :address, :building, :phone_number, :purchase_record


  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input hyphen(-)" }
    validates :shipping_area_id
    validates :municipalities, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone_number, format: { with:/\A\d{10,11}\z/, message: "is invalid. Input half-width numbers."}
    validates :token
  end

  validates :shipping_area_id, numericality: { other_than: 1 } 


  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id )
  end
end