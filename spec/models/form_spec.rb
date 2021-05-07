require 'rails_helper'

RSpec.describe Form, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @form = FactoryBot.build(:form, user_id: @user.id, item_id: @item.id)
      sleep 0.5
    end

    describe '商品購入機能' do
      context '正常系' do
        it '全ての項目が入力出来ていれば購入出来る事' do
          expect(@form).to be_valid
        end

        it '建物名は空でも保存出来る事' do
          @form.building = ''
          expect(@form).to be_valid
        end
      end

      context '異常系' do
        it 'user_idが空では保存出来ない事' do
          @form.user_id = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("User can't be blank")
        end

        it 'item_idが空では保存出来ない事' do
          @form.item_id = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("Item can't be blank")
        end
        
        it 'tokenが空では保存出来ない事' do
          @form.token = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("Token can't be blank")
        end
        it '郵便番号が空の状態では保存出来ない事' do
          @form.postal_code = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("Postal code can't be blank")
        end

        it '郵便番号が全角文字では保存出来ない事' do
          @form.postal_code = 'あああああ'
          @form.valid?
          expect(@form.errors.full_messages).to include('Postal code is invalid. Input hyphen(-)')
        end

        it '郵便番号がハイフン無しでは登録出来ない事' do
          @form.postal_code = '1234567'
          @form.valid?
          expect(@form.errors.full_messages).to include('Postal code is invalid. Input hyphen(-)')
        end

        it '都道府県が何も選択していない状態では保存出来ない事' do
          @form.shipping_area_id = 1
          @form.valid?
          expect(@form.errors.full_messages).to include('Shipping area must be other than 1')
        end

        it '市区町村が空の状態では保存出来ない事' do
          @form.municipalities = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("Municipalities can't be blank")
        end

        it '市区町村が半角文字では保存出来ない事' do
          @form.municipalities = 'abc'
          @form.valid?
          expect(@form.errors.full_messages).to include('Municipalities is invalid. Input full-width characters.')
        end

        it '番地が空の状態では保存出来ない事' do
          @form.address = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("Address can't be blank")
        end

        it '電話番号が空の状態では保存出来ない事' do
          @form.phone_number = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("Phone number can't be blank")
        end

        it '電話番号が全角文字では保存出来ない事' do
          @form.phone_number = 'あああああああ'
          @form.valid?
          expect(@form.errors.full_messages).to include('Phone number is invalid. Input half-width 10-11numbers.')
        end

        it '電話番号が11桁よりも大きい場合保存出来ない事' do
          @form.phone_number = '123456789000'
          @form.valid?
          expect(@form.errors.full_messages).to include('Phone number is invalid. Input half-width 10-11numbers.')
        end
      end
    end
  end
end
