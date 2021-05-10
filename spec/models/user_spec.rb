require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '正常系' do
        it '全ての項目の入力が出来ていれば登録出来る事' do
          expect(@user).to be_valid
        end
      end

      context '異常系' do
        it 'passwordが6文字以上且つ英数字があれば登録出来ること' do
          @user.password = 'aaa123'
          @user.password_confirmation = 'aaa123'
          expect(@user).to be_valid
        end

        it 'passwordが空では登録出来ない事' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードを入力してください')
        end

        it 'nicknameが空では登録できないこと' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('ニックネームを入力してください')
        end

        it 'emailが空では登録出来ないこと' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('Eメールを入力してください')
        end

        it 'emailに@が無いと登録出来ないこと' do
          @user.email = 'email.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Eメールは不正な値です')
        end

        it 'passwordが5文字以下では登録出来ない事' do
          @user.password = 'aa111'
          @user.password_confirmation = 'aa111'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
        end

        it 'passwordが英字だけでは登録出来ない事' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは半角の英数字で入力してください')
        end

        it 'passwordが数字のみでは登録出来ない事' do
          @user.password = '111111'
          @user.password_confirmation = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは半角の英数字で入力してください')
        end

        it 'passwordが全角では登録出来ない事' do
          @user.password = 'ださん'
          @user.password_confirmation = 'ださん'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは半角の英数字で入力してください')
        end

        it 'passwordとpassword_confirmationが不一致では登録出来ないこと' do
          @user.password = 'asd123'
          @user.password_confirmation = 'asd1234'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
        end

        it 'first_nameが空では登録出来ない事' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('名字を入力してください')
        end

        it 'first_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
          @user.first_name = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('名字を全角で入力してください')
        end

        it 'last_nameが空では登録出来ない事' do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('名前を入力してください')
        end

        it 'last_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
          @user.last_name = 'efg'
          @user.valid?
          expect(@user.errors.full_messages).to include('名前は全角で入力してください')
        end

        it 'first_name_kanaが空では登録出来ない事' do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('名字(カナ)を入力してください')
        end

        it 'first_name_kanaが全角カタカナ以外では登録出来ない事' do
          @user.first_name_kana = 'あいう'
          @user.valid?
          expect(@user.errors.full_messages).to include('名字(カナ)を全角カタカナで入力してください')
        end

        it 'last_name_kanaが空では登録出来ない事' do
          @user.last_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('名前(カナ)を入力してください')
        end

        it 'last_name_kanaが全角カタカナ以外では登録出来ない事' do
          @user.last_name_kana = 'あいう'
          @user.valid?
          expect(@user.errors.full_messages).to include('名前(カナ)は全角カタカナで入力してください')
        end

        it 'birthdayが空では登録出来ない事' do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('誕生日を入力してください')
        end

        it '重複したemailが存在する場合登録出来ない事' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
        end
      end
    end
  end
end
