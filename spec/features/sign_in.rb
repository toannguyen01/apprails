def sign_in
  before(:each) do
    user =  FactoryBot.build(:user)
    visit new_user_session_path
    expect(page).to have_content "Log in"
    fill_in 'user_email', with: "ductoannguyen02@gmail.com"   
    fill_in 'user_password', with: "ductoan" 
    click_on 'Log in'   
    expect(page).to have_content "Signed in successfully." 
    @current_user = User.find_by_email(user.email)
  end

end