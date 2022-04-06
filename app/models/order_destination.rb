class OrderDestination
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :ship_from_id, :city, :address, :building_name, :phone_number, :order_id

  with_options presence: true do
      validates :user_id
      validates :item_id
      validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      validates :ship_from_id, numericality: {other_than: 1, message: "can't be blank"}
      validates :city
      validates :address
      validates :phone_number, format: {with: /\d{10,11}/}, length: {maximum: 11}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, ship_from_id: ship_from_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end


