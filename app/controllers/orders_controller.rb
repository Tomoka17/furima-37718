class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new
  end


  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def order_params
      params.require(:order_destination).permit(
        :postal_code, :ship_from_id, :city, :address, :phone_number, :order_id).merge(
        user_id: current_user.id, item_id: params[:id])
    end


end
