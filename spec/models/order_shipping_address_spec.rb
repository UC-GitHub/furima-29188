require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    @order_shipping_address = FactoryBot.build(:order_shipping_address)
    # 処理速度を遅くする
    # sleep(1)
  end

  describe '商品購入' do
    context '購入が上手くいくとき' do
      it "token, postal_code, shipping_from_id, city, street_adress, phone_number, item_id, user_idがあり、buildingは空でも購入できる" do
        expect(@order_shipping_address).to be_valid
      end
    end
  end


  describe '商品購入' do
    context '購入が上手くいかないとき' do
      it "tokenが生成されないと登録できない" do
        @order_shipping_address.token = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空だと登録できない" do
        @order_shipping_address.postal_code = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeはハイフンがないと登録できない" do
        @order_shipping_address.postal_code = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code invalid: Input Half-width numbers with hyphen")
      end
      it "shipping_from_idが0だと登録できない" do
        @order_shipping_address.shipping_from_id = '0'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Shipping from can't be blank")
      end
      it "cityが空だと登録できない" do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it "street_addressが空だと登録できない" do
        @order_shipping_address.street_address = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Street address can't be blank")
      end
      it "phone_numberが１２桁以上だと登録できない" do
        @order_shipping_address.phone_number = '123456789123'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")  
      end
    end
  end
end
