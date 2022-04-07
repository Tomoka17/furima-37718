class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order
  before_action :move_to_index

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

    def move_to_index
        @item = Item.find(params[:item_id])
      if @item.order.present? || @item.user_id == current_user.id
        redirect_to root_path
      end
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end

end
