class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :user, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :item_status_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :freight_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :ship_from_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :day_to_ship_id, numericality: { other_than: 1, message: "can't be blank" } 

  belongs_to :user
  has_one_attached :image
  # has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :day_to_ship, :freight, :item_status, :ship_from

end
