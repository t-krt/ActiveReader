def sign_in_as(user)
    visit root_path
    first(:link, "ログイン").click
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    first(:css, 'input[name="commit"]').click
end
