require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER'] 
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe '新規投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end

  context '新規投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      sign_in(@user)
      # 投稿ページに移動する
      visit new_item_path
      # フォームに情報を入力する
      fill_in '作品', with: @item.image
      fill_in 'コメント', with: @item.text
      fill_in '作った年齢（半角数字）', with: @item.age
      fill_in '材料', with: @item.material
      fill_in '作り方', with: @item.making
      # 送信するとItemモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Item.count }.by(1)
      # トップページに遷移する
      visit root_path
    end
  end
  context '新規投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      basic_pass root_path
      # 新規投稿ページへのボタンがないことを確認する
      expect(page).to have_no_content('投稿する')
    end
  end 
end

# RSpec.describe '投稿編集', type: :system do
#   before do
#     @item1 = FactoryBot.create(:item)
#     @item2 = FactoryBot.create(:item)
#   end
#   context '投稿を編集できるとき' do
#     it 'ログインしたユーザーは自分の投稿を編集ができる' do
#       # item1を投稿したユーザーでログインする
#       sign_in(@item1.user)
#       # item1の詳細ページに移動する
#       visit item_path(@item1)
#       # item1に「編集する」ボタンがあることを確認する
#       expect(page).to have_selector('.edit__btn', text: '編集する')
#       # 編集ページへ遷移する
#       visit edit_item_path(@item1)
#       # すでに投稿済みの内容がフォームに入っていることを確認する
#       expect(
#         find('#item_text').value
#       ).to eq(@item1.text)
#       expect(
#         find('#item_material').value
#       ).to eq(@item1.material)
#       expect(
#         find('#item_making').value
#       ).to eq(@item1.making)
#       # 投稿内容を編集する
#       fill_in 'コメント', with: "#{@item1.text}+編集したテキスト"
#       fill_in 'コメント', with: "#{@item1.material}+編集したテキスト"
#       fill_in 'コメント', with: "#{@item1.making}+編集したテキスト"
#       fill_in '作った年齢（半角数字）', with: "#{@item1.age}"
#       # 編集してもItemモデルのカウントは変わらないことを確認する
#       expect{
#         find('input[name="commit"]').click
#       }.to change { Item.count }.by(0)
#       # 詳細ページに遷移する
#       visit item_path(@item1)
#     end
#   end
#   context '投稿を編集できないとき' do
#     it 'ログインしたユーザーは自分以外が投稿した編集画面には遷移できない' do
#       # item1を投稿したユーザーでログインする
#       sign_in(@item1.user)
#       # item2の詳細ページに移動する
#       visit item_path(@item2)
#       # item2に「編集する」ボタンがないことを確認する
#       expect(page).to have_no_selector('.edit__btn', text: '編集する')

#     end
#     it 'ログインしていないと投稿の編集画面には遷移できない' do
#       # トップページにいる
#       basic_pass root_path
#       # item1の詳細ページに移動する
#       visit item_path(@item1)
#       # item1に「編集する」ボタンがないことを確認する
#       expect(page).to have_no_selector('.edit__btn', text: '編集する')
#     end
#   end
# end

# RSpec.describe '投稿削除', type: :system do
#   before do
#     @item1 = FactoryBot.create(:item)
#     @item2 = FactoryBot.create(:item)
#   end
#   context '投稿削除ができるとき' do
#     it 'ログインしたユーザーは自分の投稿のみ削除ができる' do
#       # item1を投稿したユーザーでログインする
#       sign_in(@item1.user)
#       # item1の詳細ページに移動する
#       visit item_path(@item1)
#       # item1に「削除する」ボタンがあることを確認する
#       expect(page).to have_selector('.destroy__btn', text: '削除する')
#       # 投稿を削除するとレコードの数が1減ることを確認する
#       expect{
#         click_on '削除する'
#       }.to change { Item.count }.by(-1)
#       # トップページに遷移する
#       visit root_path
#     end
#   end
#   context '投稿削除ができないとき' do
#     it 'ログインしたユーザーは自分以外の投稿を削除ができない' do
#       # item1を投稿したユーザーでログインする
#       sign_in(@item1.user)
#       # item2の詳細ページに移動する
#       visit item_path(@item2)
#       # item2に「削除する」ボタンがないことを確認する
#       expect(page).to have_no_selector('.destroy__btn', text: '削除する')
#     end
#     it 'ログインしていないと投稿ツイートの削除ボタンがない' do
#       # トップページに移動する
#       basic_pass root_path
#       # item1の詳細ページに移動する
#       visit item_path(@item1)
#       # item1に「削除する」ボタンがないことを確認する
#       expect(page).to have_no_selector('.destroy__btn', text: '削除する')
#     end
#   end
# end

# RSpec.describe '投稿詳細', type: :system do
#   before do
#     @user = FactoryBot.create(:user)
#     @item = FactoryBot.create(:item)
#   end
#   it 'ログインしたユーザーはツイート詳細ページに遷移してコメント投稿欄が表示される' do
#     # ログインする
#     sign_in(@user)
#     # 詳細ページに遷移する
#     visit item_path(@item)    
#     # コメント用のフォームが存在する
#     expect(page).to have_selector 'form'
#   end
#   it 'ログインしていない状態でツイート詳細ページに遷移できるもののコメント投稿欄が表示されない' do
#     # トップページに移動する
#     basic_pass root_path
#     # 詳細ページに遷移する
#     visit item_path(@item)
#     # フォームが存在しないことを確認する
#     expect(page).to have_no_selector 'form'
#   end
# end
