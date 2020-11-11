class OrderAddress
  include ActiveModel::Model
  attr_accessor :name, :price, :shipping_cost_id, :post_num, :prefecture_id, :city, :house_num, :phone_num, :building_name, :token, :user_id, :item_id

  with_options presence: true do
    validates :post_num
    validates :prefecture_id
    validates :city
    validates :house_num
    validates :phone_num
    validates :token
  end
  validates :post_num,       format: { with: /\A\d{3}-\d{4}\z/ }
  validates :phone_num,      length: { maximum: 11 }
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_num: post_num, prefecture_id: prefecture_id, city: city, house_num: house_num, phone_num: phone_num, building_name: building_name, order_id: order.id)
  end
end
