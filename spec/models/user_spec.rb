require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    # 処理速度を遅くする
    # sleep(1)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が上手くいくとき' do
      it "nickname、email、password、password_confirmation、family_name、first_name、kana_family_name、kana_first_name、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "family_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.family_name = "あア阿"
        expect(@user).to be_valid
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.first_name = "あア阿"
        expect(@user).to be_valid
      end
    end

    context '新規登録が上手くいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "aaaa1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "pasword_confirmationがpasswordと一致しないと登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが半角英数字混合でなければ登録できない" do
          @user.password = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password must include both letters and numbers")
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "family_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
      # 半角アルファベット（大文字・小文字・数値）=> /\A[a-zA-Z0-9]+\z/
        @user.family_name = '/\A[a-zA-Z0-9]+\z/'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name must be Full-width characters")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name must be Full-width characters")
      end
      it "kana_family_nameが空だと登録できない" do
        @user.kana_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name can't be blank")
      end
      it "kana_family_nameが全角カタカナでないと登録できない" do
        @user.kana_family_name = 'あ阿'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name must be Full-width katakana characters")
      end
      it "kana_first_nameが空だと登録できない" do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it "kana_first_nameが全角カタカナでないと登録できない" do
        @user.kana_first_name = 'あ阿'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name must be Full-width katakana characters")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
