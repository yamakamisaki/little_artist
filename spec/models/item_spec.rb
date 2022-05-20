require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '新規作品投稿' do
    context '新規作品投稿できる場合' do
      it 'image、age、text、userがある場合はできる' do
        expect(@item).to be_valid
      end
      it 'materialが空でも投稿できる' do
        @item.material = ''
        expect(@item).to be_valid
      end
      it 'makingが空でも投稿できる' do
        @item.making = ''
        expect(@item).to be_valid
      end
    end

    context '新規作品投稿できない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像を入力してください')
      end
      it 'ageが空では保存できない' do
        @item.age = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('年齢を入力してください')
      end
      it 'ageが半角数字以外では保存できない' do
        @item.age = '２さい'
        @item.valid?
        expect(@item.errors.full_messages).to include('年齢は半角数字で入力してください')
      end
      it 'ageが99以上では保存できない' do
        @item.age = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('年齢は半角数字で入力してください')
      end
      it 'textが空では保存できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('コメントを入力してください')
      end
      it 'textが200文字以上では保存できない' do
        @item.text = 'あ' * 201
        @item.valid?
        expect(@item.errors.full_messages).to include('コメントは200文字以内で入力してください')
      end
      it 'materialが200文字以上では保存できない' do
        @item.material = 'あ' * 201
        @item.valid?
        expect(@item.errors.full_messages).to include('材料は200文字以内で入力してください')
      end
      it 'makingが200文字以上では保存できない' do
        @item.making = 'あ' * 201
        @item.valid?
        expect(@item.errors.full_messages).to include('作り方は200文字以内で入力してください')
      end
      it 'userが紐づいていない場合は保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
