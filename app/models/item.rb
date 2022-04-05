class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day_to_ship
  belongs_to :freight
  belongs_to :item_status
  belongs_to :ship_from

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :price, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999
  }
  validates :user, presence: true
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :freight_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_from_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :day_to_ship_id, numericality: { other_than: 1, message: "can't be blank" }
end
