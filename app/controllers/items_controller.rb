class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new]
  before_action :move_to_new,   except: :index

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :shipment_source_id, :shipping_cost_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def move_to_new
    redirect_to new_user_session_path unless user_signed_in?
  end
end
