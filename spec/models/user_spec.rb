require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての項目の入力が出来ていれば登録出来る事' do
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上且つ英数字があれば登録出来ること' do
      @user.password = 'aaa123'
      @user.password_confirmation = 'aaa123'
      expect(@user).to be_valid
    end

    it 'passwordが空では登録出来ない事' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録出来ないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@が無いと登録出来ないこと' do
      @user.email = 'email.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが5文字以下では登録出来ない事' do
      @user.password = 'aa111'
      @user.password_confirmation = 'aa111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが英字だけでは登録出来ない事' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが数字のみでは登録出来ない事' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが全角では登録出来ない事' do
      @user.password = 'ださん'
      @user.password_confirmation = 'ださん'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordとpassword_confirmationが不一致では登録出来ないこと' do
      @user.password = 'asd123'
      @user.password_confirmation = 'asd1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが空では登録出来ない事' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.first_name = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invaild. Input full-width characters')
    end

    it 'last_nameが空では登録出来ない事' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.last_name = 'efg'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invaild. Input full-width characters')
    end

    it 'first_name_kanaが空では登録出来ない事' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'first_name_kanaが全角カタカナ以外では登録出来ない事' do
      @user.first_name_kana = 'あいう'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invaild. Input full-width katakana characters')
    end

    it 'last_name_kanaが空では登録出来ない事' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'last_name_kanaが全角カタカナ以外では登録出来ない事' do
      @user.last_name_kana = 'あいう'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invaild. Input full-width katakana characters')
    end

    it 'birthdayが空では登録出来ない事' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it '重複したemailが存在する場合登録出来ない事' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
  end
end
