require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '正常系' do
        it '全ての項目の入力が出来ていれば登録出来る事' do
          expect(@item).to be_valid
        end
      end

      context '異常系' do
        it '出品画像が空の状態では保存出来ない事' do
          @item.image = nil
          expect(@item).to be_valid
        end

        it '商品名が空の状態では保存出来ない事' do
          @item.product_name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Product name can't be blank")
        end

        it '商品名が40文字以内に収めないと保存出来ない事' do
          @item.product_name = 'a' * 41
          @item.valid?
          expect(@item.errors.full_messages).to include('Product name is too long (maximum is 40 characters)')
        end

        it '商品の説明が空の状態では保存出来ない事' do
          @item.product_description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Product description can't be blank")
        end

        it '商品の説明が1000文字以内に収めないと保存出来ない事' do
          @item.product_description = 'a' * 1001
          @item.valid?
          expect(@item.errors.full_messages).to include('Product description is too long (maximum is 1000 characters)')
        end

        it 'カテゴリーが何も選択していない時は保存出来ない事' do
          @item.product_category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Product category must be other than 1')
        end

        it '商品の状態が何も選択していない時は保存出来ない事' do
          @item.product_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Product status must be other than 1')
        end

        it '配送料の負担が何も選択していない時は保存出来ない事' do
          @item.shipping_fee_burden_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping fee burden must be other than 1')
        end

        it '発送元の地域が何も選択していない時は保存出来ない事' do
          @item.shipping_area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
        end

        it '発送までの日数が何も選択していない時は保存出来ない事' do
          @item.shipping_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
        end

        it '価格が空の状態では保存出来ない事' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it '価格が整数のみでしか保存出来ない事' do
          @item.price =0.03
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be an integer")
        end

        it '価格が300円以下では出品投稿も出来ない事' do
          @item.price = 250
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than 299")
        end

        it '価格が10000000円以上では出品投稿もできないこと' do
          @item.price = 100000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than 10000000")
        end
      end
    end
  end
end
