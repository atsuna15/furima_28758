require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/sample.jpg')
    end
    describe '商品の出品' do
      context "商品が出品できる場合" do
        it 'nameとimage、content、category、status、delivery_price、region、day、priceが存在していれば保存できること' do
          expect(@item).to be_valid
        end
      end
      context "商品が出品できないとき" do
        it 'nameが存在しないとき' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'imageが存在しないとき' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'contentが存在しないとき' do
          @item.content = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Content can't be blank")
        end
        it 'category_idが1のとき' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category Select")
        end
        it 'status_idが1のとき' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status Select")
        end
        it 'delivery_price_idが1のとき' do
          @item.delivery_price_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery price Select")
        end
        it 'region_idが1のとき' do
          @item.region_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Region Select")
        end
        it 'day_idが1のとき' do
          @item.day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Day Select")
        end
        it 'priceが存在しないとき' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが299円以下のとき' do
          @item.price  = (0..299)
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
        it 'priceが1000万円以上のとき' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
        it 'priceが全角数字で記入されているとき' do
          @item.price = '３０００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Half-width number")
        end
      end
    end
  end
end
