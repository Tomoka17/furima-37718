class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end  

  def create
    @item = Item.new(item_params)
  end

  private
    def item_params
      params.require(:item).permit(
        :image,:name,:price,:description,:category_id,:item_status_id,
        :freight_id,:ship_from_id,:day_to_ship_id).merge(
        user_id: current_user.id)
    end
  end  


