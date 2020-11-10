class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order = @item
    redirect_to root_path unless @item.order.nil?
  end

  def create
    @order = OrderAddress.new(order_address_params)
    if @order.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: order_address_params[:token],
        currency: 'jpy'
      )
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
end
