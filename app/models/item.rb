class Item < ApplicationRecord
  with_options presence: true do
    validates :product_name
    validates :product_description
    validates :product_category_id
    validates :product_status_id
    validates :shipping_fee_burden_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price
  end

  validates :product_name, length: { maximum: 40 }
  validates :product_description, length: { maximum: 1000 }
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :product_status
  belongs_to :shipping_fee_burden
  belongs_to :shipping_area
  belongs_to :shipping_day

  with_options numericality: { other_than: 1 } do
    validates :product_category_id
    validates :product_status_id
    validates :shipping_fee_burden_id
    validates :shipping_area_id
    validates :shipping_day_id
  end
end
