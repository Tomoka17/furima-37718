class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
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
  end

  def edit
    if @item.order.present?
      redirect_to root_path
    else
      @item.user_id == current_user.id
      render 'edit'
    end  
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render 'edit'
    end
  end

  def destroy
      @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path  
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

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
