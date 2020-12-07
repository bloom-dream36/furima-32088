require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規投稿がうまくいく時' do
      it 'nicknameとemail、passwordとpasseword_confirmation、first_nameとlast_name、kana_firstとlast_first、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが40文字以内なら登録できる' do
        @user.nickname = 'aaa'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上の英数字混合なら登録でる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
    end


    context '新規投稿がうまくいかない時'do
      it 'nicknameが空だとログインできない' do  
        @user.nickname = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do  
        @user.email = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emalhaは@がなければ登録できない' do  
        @user.email = 'aaaaaa'  
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailは登録できない' do  
        @user.save
        user2 = FactoryBot.build(:user)
        user2.email = @user.email
        user2.valid?
        expect(user2.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは6文字以上でないと登録できない' do
        @user.password = 'aaa22'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英字のみの場合登録できない' do
        @user.password = 'aaaaaa'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが半角数字のみの場合登録できない' do
        @user.password = 111111
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが全角英数字の場合登録できない'do
         @user.password = 'a１２３４５６'
         @user.valid?
         expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '確認用と含めて２回入力する' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '確認用と値が一致する必要がある' do
        @user.password = 'aaa3333'
        @user.password_confirmation = 'aaa333'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'kana_firstが空では登録できない' do
        @user.kana_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first can't be blank")
      end
      it 'kana_lastが空では登録できない' do
        @user.kana_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last can't be blank")
      end
      it 'ユーザーのfirst_nameは全角（漢字、ひらがな、カタカナで入力される)' do
        @user.first_name = 'aiu'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文を使用してください")
      end
      it 'ユーザーのlast_nameは全角(漢字、ひらがな、カタカナで入力される)' do
         @user.last_name = 'kakiku'
         @user.valid?
         expect(@user.errors.full_messages).to include("Last name 全角文を使用してください")
      end
      it 'ユーザーのフリガナは全角（カタカナ）で入力される' do
        @user.kana_first = 'eo'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Kana first is invalid")
      end
      it 'ユーザーのフリガナは全角（カタカナ）で入力される' do
         @user.kana_last = 'aiu'
         @user.valid?
         expect(@user.errors.full_messages).to include ("Kana last is invalid")
      end
      it 'birthdayが空では入力できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
