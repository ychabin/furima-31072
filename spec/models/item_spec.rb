require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品がうまくいくとき' do
      it 'nameとcategory_idとcondition_id、shipment_source_id、shipping＿cost、shipping_day、price,imageが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品がうまくいかないとき' do
      it 'nameが空のとき' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空のとき' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが空のとき' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idが空のとき' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'shipment_source_idが空のとき' do
        @item.shipment_source_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment source must be other than 1')
      end
      it 'shipping_cost_idが空のとき' do
        @item.shipping_cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost must be other than 1')
      end
      it 'shipping_days_idが空のとき' do
        @item.shipping_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping days must be other than 1')
      end
      
      it 'priceが空だと出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが10000000だと出品できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceが半角数字以外だと出品できない' do
        @item.price = '９９９'
        @item.valid?
        binding.pry
        expect(@item.errors.full_messages).to include("Price 半角数字での入力が必須であること", "Price is not included in the list")
      end
      
      
      
    end
  end
end
