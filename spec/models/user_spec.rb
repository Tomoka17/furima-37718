require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end  

  describe "ユーザー新規登録" do

    context "ユーザー新規登録できるとき" do
      it "全ての項目の入力が正しければ登録できること" do
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが6文字以上で半角英数字含んだとき登録できる" do
        @user.password = 'aaa1111'
        @user.password_confirmation = 'aaa1111'
        expect(@user).to be_valid
      end
      it "last_name、first_nameが全角であれば登録できる" do
        @user.last_name = '肥後'
        @user.first_name = 'さくら'
        expect(@user).to be_valid
      end
      it "last_name_kana、first_name_kanaが全角であれば登録できる" do
        @user.last_name_kana = 'ヒゴ'
        @user.first_name_kana = 'サクラ'
        expect(@user).to be_valid
      end  
    end

    context "ユーザー新規登録できないとき" do 
      it "nicknameがない場合、登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailがない場合、登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは@を含まないと登録できない" do
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordがない場合、登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = 'aaa1111'
        @user.password_confirmation = 'bbb1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが数字だけでは登録できない" do
        @user.password = '1111111'
        @user.password_confirmation = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが英字だけでは登録できない" do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが6文字未満では登録できない" do
        @user.password = 'aa111'
        @user.password_confirmation = 'aa111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが全角では登録できない" do
        @user.password = 'ａａａ１１１１'
        @user.password_confirmation = 'ａａａ１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end  
      it "last_nameがないと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end
      it "last_nameが半角では登録できない" do
        @user.last_name = 'ﾋｺﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end  
      it "last_name_kanaがないと登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
      end
      it "last_name_kanaが半角では登録できない" do
        @user.last_name_kana = 'ﾋｺﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "first_nameがないと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it "first_nameが半角では登録できない" do
        @user.first_name = 'ｻｸﾗ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end  
      it "first_name_kanaがないと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end
      it "first_name_kanaが半角では登録できない" do
        @user.first_name_kana = 'ｻｸﾗ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "birthdayがないと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
