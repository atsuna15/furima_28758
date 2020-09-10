require 'rails_helper'

RSpec.describe CustomerAddress, type: :model do
  describe '住所情報の保存' do 
    before do 
      @customer_address = FactoryBot.build(:customer_address)
    end

    context '住所情報ができるとき' do
      it '全ての情報が存在していれば保存できること' do
        expect(@customer_address).to be_valid
      end
      it 'building_nameが空でも保存できること' do
        @customer_address.building_name = nil
        @customer_address.valid?
        expect(@customer_address).to be_valid
      end
    end
    context '住所情報が保存できないとき' do
      it '郵便番号が空のとき' do
        @customer_address.postal_code = nil
        @customer_address.valid?
        expect(@customer_address.errors.full_messages).to include("Postal code can't be blank" , "Postal code Input correctly")
      end
      it '都道府県が選択されていないとき' do
        @customer_address.region_id = 1
        @customer_address.valid?
        expect(@customer_address.errors.full_messages).to include("Region Select")
      end
      it '市町村が空のとき' do
        @customer_address.city = nil
        @customer_address.valid?
        expect(@customer_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空のとき' do
        @customer_address.number = nil
        @customer_address.valid?
        expect(@customer_address.errors.full_messages).to include("Number can't be blank")
      end
      it '電話番号が空のとき' do
        @customer_address.phone_number = nil
        @customer_address.valid?
        expect(@customer_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'tokenが空のとき' do
        @customer_address.token = nil
        @customer_address.valid?
        expect(@customer_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号にハイフンが含まれていないとき' do
        @customer_address.postal_code = '1234567'
        @customer_address.valid?
        expect(@customer_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it '電話番号にハイフンが含まれているとき' do
        @customer_address.phone_number = '123-456-789'
        @customer_address.valid?
        expect(@customer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上のとき' do
        @customer_address.phone_number = "123456789102"
        @customer_address.valid?
        expect(@customer_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
