class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipment_source
  belongs_to :shipping_cost
  belongs_to :shipping_day
  has_one :order

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipment_source_id
    validates :shipping_cost_id
    validates :shipping_day_id
  end
  with_options presence: true do
    validates :name
    validates :text
    validates :price, numericality: { with: /\A[0-9]+\z/, message: '半角数字での入力が必須であること' }
    validates :image
  end
  validates_inclusion_of :price, in: 300..9_999_999
end
