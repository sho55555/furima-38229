require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  describe '商品購入入力' do
    context '入力した購入情報で商品を購入できる' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@order_shipping).to be_valid
      end

      it 'buildingがあっても購入できる' do
        expect(@order_shipping).to be_valid
      end
    end

    context '入力した購入情報で商品を購入できない' do
      it 'postal_codeが空だと購入できない' do
        @order_shipping.postal_code = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが「3桁ハイフン4桁」でないと購入できない' do
        @order_shipping.postal_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code is invalid')
      end

      it 'prefecture_idが空だと購入できない' do
        @order_shipping.prefecture_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと購入できない' do
        @order_shipping.city = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end

      it 'addressesが空だと購入できない' do
        @order_shipping.addresses = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Addresses can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @order_shipping.phone_number = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが「10桁以上11桁以内の半角数値」でないと購入できない' do
        @order_shipping.phone_number = 123_456_789
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid')
      end

      it 'user_idが空だと購入できない' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと購入できない' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では購入できないこと' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
