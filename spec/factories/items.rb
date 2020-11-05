FactoryBot.define do
  factory :item do
    name                { 'sannma' }
    text                { 'sakana' }
    category_id         { '2' }
    condition_id        { '2' }
    shipment_source_id  { '2' }
    shipping_cost_id { '2' }
    shipping_day_id { '2' }
    price { 1000 }
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/kirin.jpeg'), filename: 'kirin.jpeg')
    end
  end
end
