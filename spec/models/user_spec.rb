require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいく時' do
        it 'nicknameとemail,password、password_confirmation、姓名とカナ、生年月日が存在すれば登録できる' do
          expect(@user).to be_valid
        end
        it 'passwordが6文字以上であれば登録できること' do
          @user.password = 'aaaaa1'
          @user.password_confirmation = 'aaaaa1'
          expect(@user).to be_valid
        end
        it 'passwordが英数字混合であれば登録できること' do
          @user.password = 'aaaaa1'
          @user.password_confirmation = 'aaaaa1'
          expect(@user).to be_valid
        end
        it 'ユーザ本名の姓は全角(漢字・ひらがな・カタカナ)で入力すれば登録できること' do
          @user.familiy_name = '小ばタ'
          expect(@user).to be_valid
        end
        it 'ユーザ本名の名は全角(漢字・ひらがな・カタカナ)で入力すれば登録できること' do
          @user.first_name = 'あ津シ'
          expect(@user).to be_valid
        end
        it 'ユーザ本名の姓のフリガナは全角(カタカナ)で入力すれば登録できること' do
          @user.family_name_k = 'コバタ'
          expect(@user).to be_valid
        end
        it 'ユーザ本名の名のフリガナは全角(カタカナ)で入力すれば登録できること' do
          @user.first_name_k = 'アツシ'
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空では登録できない' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できないこと' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'passwordが空では登録できないこと' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'family_nameが空では登録できないこと' do
          @user.familiy_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Familiy name can't be blank", 'Familiy name Full-width characters')
        end
        it 'first_nameが空では登録できないこと' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank", 'First name Full-width characters')
        end
        it 'family_name_kが空では登録できないこと' do
          @user.family_name_k = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name k can't be blank", 'Family name k Full-width katakana characters')
        end
        it 'first_name_kが空では登録できないこと' do
          @user.first_name_k = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name k can't be blank", 'First name k Full-width katakana characters')
        end
        it 'birthが空では登録できないこと' do
          @user.birth = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth can't be blank")
        end
        it 'passwordが5文字以下であれば登録できないこと' do
          @user.password = 'aaaa1'
          @user.password_confirmation = 'aaaa1'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordが英数字混合でなければ登録できないこと' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
        end
        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'ユーザ本名の姓は全角(漢字・ひらがな・カタカナ)で入力しなければ登録できないこと' do
          @user.familiy_name = 'kobata'
          @user.valid?
          expect(@user.errors.full_messages).to include('Familiy name Full-width characters')
        end
        it 'ユーザ本名の名は全角(漢字・ひらがな・カタカナ)で入力しなければ登録できないこと' do
          @user.first_name = 'kobata'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name Full-width characters')
        end
        it 'ユーザ本名の姓のフリガナは全角(カタカナ)で入力しなければ登録できないこと' do
          @user.family_name_k = 'こばた'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name k Full-width katakana characters')
        end
        it 'ユーザ本名の名のフリガナは全角(カタカナ)で入力しなければ登録できないこと' do
          @user.first_name_k = 'あつし'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name k Full-width katakana characters')
        end
      end
    end
  end
end