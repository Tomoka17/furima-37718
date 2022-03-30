class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :user, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :item_status_id, presence: true
  validates :freight_id, presence: true
  validates :ship_from_id, presence: true
  validates :day_to_ship_id, presence: true

  belongs_to :user
  # has_one :order
end
