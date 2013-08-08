def save_and_sign_in
  @user.save
  visit   '/login'
  fill_in 'user_login',    with: @u[:email]
  fill_in 'user_password', with: @u[:password]
  click_button 'Logga in'
end

def newjohn
  @u = {}
  @u[:email]    = 'john@urkraft.lab'
  @u[:password] = 'veryh9pass'
  @u[:password_confirmation] = @u[:password]
  @u[:confirmed_at] = Time.now
end

def sign_in_as_user
  newjohn
  @user = Fabricate :user, @u
  save_and_sign_in
end
