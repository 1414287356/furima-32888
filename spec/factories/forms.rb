FactoryBot.define do
  factory :form do
    postal_code { '234-7643' }
    shipping_area_id { 3 }
    municipalities { '岩手市' }
    address { Faker::Address.building_number }
    building { 'ハイツ222号' }
    phone_number { '05912345678' }
    token { 'tok_abcdefghijkl0000000000' }
  end
end
