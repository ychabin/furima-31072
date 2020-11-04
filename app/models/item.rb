class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipment_source, :shipping_cost, :shipping_day
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipment_source_id
    validates :shipping_cost_id
    validates :shipping_days_id
  end
  with_options presence: true do
    validates :name
    validates :text
    validates :price, numericality: { with: /\A[0-9]+\z/, message: '半角数字での入力が必須であること' }
    validates :image
  end
  validates_inclusion_of :price, in: 300..9_999_999
end
