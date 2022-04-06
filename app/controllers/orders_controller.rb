class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]

  def index
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
    def set_order
      @item = Item.find(params[:item_id])
    end

    def order_params
      params.require(:order_destination).permit(
        :postal_code, :ship_from_id, :building_name, :city, :address, :phone_number).merge(
        user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = "sk_test_a5d78a19c659eeed0a1a3a8c"
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end

end
