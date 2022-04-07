require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_destination = FactoryBot.build(
      :order_destination, user_id: user.id, item_id: item.id)
      sleep 0.1  
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it '全ての項目の入力が正しければ購入できること' do
        expect(@order_destination).to be_valid
      end
      it 'building_nameは空でも購入できること' do
        @order_destination.building_name = ""
        expect(@order_destination).to be_valid
      end
    end

    context '商品購入できないととき' do
      it '郵便番号が空では購入できないこと' do
        @order_destination.postal_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が3桁ハイフン4桁の正しい形でないと購入できないこと' do
        @order_destination.postal_code = "1111111"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号が全角では購入できないこと' do
        @order_destination.postal_code = "１１１ー１１１１"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が未選択では購入できないこと' do
        @order_destination.ship_from_id = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Ship from can't be blank")
      end
      it '市区町村が空では購入できないこと' do
        @order_destination.city = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できないこと' do
        @order_destination.address = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では購入できないこと' do
        @order_destination.phone_number = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it '電話番号が12桁以上では購入できないこと' do
        @order_destination.phone_number = "111111111111"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid", "Phone number is too long (maximum is 11 characters)")
      end
      it '電話番号が全角数字では購入できないこと' do
        @order_destination.phone_number = "０９０１１１１１１１１"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idと紐づいていないと購入できないこと' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idと紐づいていないと購入できないこと' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end
      it 'トークンが受け取れないと購入できないとき' do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")

      end
    end
  end

end
  
