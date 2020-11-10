class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, except: [:index]

  def index
    return redirect_to root_path if !user_signed_in? || current_user.id == @item.user_id

    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_address_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_address_params
    params.permit(:post_num, :prefecture_id, :city, :house_num, :building_name, :item_id, :phone_num, :token).merge(token: params[:token], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end
end
