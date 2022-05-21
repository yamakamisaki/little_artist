require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @comment = FactoryBot.build(:comment, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe 'コメント投稿' do
    context 'コメント投稿できる場合' do
      it "text,user_id,item_idの値がある場合は投稿できる" do
        expect(@comment).to be_valid
      end
    end
    context 'コメント投稿できない場合' do
      it "textが空では投稿できない" do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('コメントを入力してください')
      end
      it 'userが紐づいていない場合は投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Userを入力してください')
      end
      it 'itemが紐づいていない場合は投稿できない' do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Itemを入力してください')
      end
    end
  end
end