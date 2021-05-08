FactoryBot.define do
  factory :item do
    product_name { Faker::Commerce.product_name }
    product_description { Faker::Lorem.sentences(number: 1) }
    product_category_id { 2 }
    product_status_id { 2 }
    shipping_fee_burden_id { 2 }
    shipping_area_id { 2 }
    shipping_day_id { 2 }
    price { Faker::Number.number(digits: 5) }

    after(:build) do | item |
      item.image.attach(io: File.open('public/images/animal_stand_neko.png'), filename: 'animal_stand_neko.png')
    end

    association :user
  end
end
