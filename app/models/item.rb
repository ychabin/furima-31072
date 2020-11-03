class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipment_source, :shipping_cost, :shipping_day

  validates :name, :text, :price, :category_id, :condition_id, :shipment_source_id, :shipping_cost_id, :shipping_days_id, presence: true
  validates :category_id, :condition_id, :shipment_source_id, :shipping_cost_id, :shipping_days_id, numericality: { other_than: 1 }
  validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字での入力が必須であること' }
  validates_inclusion_of :price, in: 300..9_999_999
end
