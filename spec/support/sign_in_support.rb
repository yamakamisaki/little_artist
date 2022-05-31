module SignInSupport
  def sign_in(user)
    basic_pass root_path
    visit new_user_session_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード（英数字6文字以上）', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
  end
end