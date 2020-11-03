FactoryBot.define do
  factory :item do
    name                { 'sannma' }
    text                { 'sakana' }
    category_id         { '2' }
    condition_id        { '2' }
    shipment_source_id  { '2' }
    shipping_cost_id { '2' }
    shipping_days_id { '2' }
    price { 1000 }
    user
  end
end
