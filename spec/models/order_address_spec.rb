require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @seller = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @seller.id)
    @buyer = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: @buyer.id, item_id: @item.id)
    sleep 1
  end
  describe '商品購入機能について' do
    context '購入がうまくいくとき' do
      it 'post_num,prefecture_id,city,house_num,phone_numが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '購入がうまくいかないとき' do
      it 'post_numが空のとき' do
        @order_address.post_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post num can't be blank", 'Post num is invalid')
      end
      it 'pefecture_idが空のとき' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空のとき' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numが空のとき' do
        @order_address.house_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House num can't be blank")
      end
      it 'phone_numが空のとき' do
        @order_address.phone_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'post_numにハイフンがないと購入できない' do
        @order_address.post_num = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post num is invalid')
      end
      it 'phone_numが11文字以上だと購入できない' do
        @order_address.phone_num = '090_1234_56789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone num is too long (maximum is 11 characters)')
      end
    end
  end
end
