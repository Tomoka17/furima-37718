class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      render "edit"
    else
      redirect_to root_path
    end  
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :price, :description, :category_id, :item_status_id,
      :freight_id, :ship_from_id, :day_to_ship_id
    ).merge(
      user_id: current_user.id
    )
  end
end
