require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe 'コメント投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @comment = FactoryBot.create(:comment)
  end

  it 'ログインしたユーザーは投稿詳細ページでコメント投稿できる' do
    # ログインする
    sign_in(@user)
    # ツイート詳細ページに遷移する
    visit item_path(@item)
    # フォームに情報を入力する
    fill_in 'comment[text]', with: @comment.text
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect  do
      click_on '送信'
    end.to change { Comment.count }.by(1)
    # 詳細ページ遷移することを確認する
    expect(current_path).to eq(item_path(@item1))
  end
end
