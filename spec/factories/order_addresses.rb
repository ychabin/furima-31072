FactoryBot.define do
  factory :order_address do
    post_num { '123-4567' }
    prefecture_id { 2 }
    city          { '札幌' }
    house_num { '1-1-1' }
    building_name { '荘' }
    phone_num { '09012345678' }
    association :user
    association :item
  end
end
