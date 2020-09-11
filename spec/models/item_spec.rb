require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/Cheese.png')
    # 処理速度を遅くする
    # sleep(1)
  end


  describe '商品新規出品' do
    context '新規出品が上手くいくとき' do
      it ":image, :name, :description, :category_id, :status_id, :shipping_fee_id, :shipping_from_id, :shipping_date_id, :price, :user_idが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '新規出品がが上手くいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空だと登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが1だと登録できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be Selected")
      end   
      it "status_idが1だと登録できない" do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be Selected")
      end   
      it "shipping_fee_idが1だと登録できない" do
        @item.shipping_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be Selected")
      end  
      it "shipping_date_idが1だと登録できない" do
        @item.shipping_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be Selected")
      end  
      it "shipping_from_idが0だと登録できない" do
        @item.shipping_from_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping from must be Selected")
      end  
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが299以下だと登録できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが10000000以上だと登録できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが半角数字でなければ登録できない" do
        @item.price = '３８０'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end
