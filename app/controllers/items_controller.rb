class ItemsController < ApplicationController
  before_action :move_to_index, except: [ :index, :new, :show]
  before_action :set_item, only: [ :edit, :show]
  before_action :authenticate_user!, except: [ :index]
  

  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new
    #redirect_to new_user_session_path unless user_signed_in?
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
  end

  def edit
    if current_user.id == @item.user.id
      edit_item_path
    else
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :shipment_source_id, :shipping_cost_id, :shipping_day_id, :image, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
