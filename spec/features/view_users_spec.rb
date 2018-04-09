require 'rails_helper'
require 'features/sign_in'

describe 'View User', type: :feature do

  it 'sign_in sussess' do
    visit new_user_registration_path
    expect(page).to have_content "Sign up"
    fill_in 'user_email', with: "ductoannguyen02@gmail.com"   
    fill_in 'user_password', with: "ductoan"
    fill_in 'user_password_confirmation', with: "ductoan"
    click_on 'Sign up'
    expect(page).to have_content "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
  end
  
  it 'sign_in error confirmation password' do
    visit new_user_registration_path
    expect(page).to have_content "Sign up"
    fill_in 'user_email', with: "ductoannguyen02@gmail.com"   
    fill_in 'user_password', with: "ductoan"
    fill_in 'user_password_confirmation', with: "ductoan1"
    click_on 'Sign up'
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  context 'sign email avail' do
    let!(:user) { create(:user, email: "ductoannguyen02@gmail.com") }
    it 'sign_in error email avail' do
      visit new_user_registration_path
      expect(page).to have_content "Sign up"
      fill_in 'user_email', with: "ductoannguyen02@gmail.com"   
      fill_in 'user_password', with: "ductoan"
      fill_in 'user_password_confirmation', with: "ductoan"
      click_on 'Sign up'
      expect(page).to have_content "Email has already been taken"
    end
  end

  context 'sign_in' do
    let!(:user) { create(:user, email: "ductoannguyen02@gmail.com", password: "ductoan") }
    it 'sign_in sussess' do
      visit new_user_session_path
      expect(page).to have_content "Log in"
      fill_in 'user_email', with: "ductoannguyen02@gmail.com"   
      fill_in 'user_password', with: "ductoan" 
      click_on 'Log in'   
      expect(page).to have_content "Signed in successfully." 
      visit new_user_session_path
      expect(page).to have_content "You are already signed in." 
    end

    it 'sign_in false' do
      visit new_user_session_path
      expect(page).to have_content "Log in"
      fill_in 'user_email', with: "ductoannguyen02@gmail.com"   
      fill_in 'user_password', with: "ductoan1" 
      click_on 'Log in'  
      expect(page).to have_content "Invalid Email or password." 
    end

    it 'edit profile' do
      visit new_user_session_path
      expect(page).to have_content "Log in"
      fill_in 'user_email', with: "ductoannguyen02@gmail.com"   
      fill_in 'user_password', with: "ductoan" 
      click_on 'Log in'  
      @current_user = User.find_by_email(user.email)
      expect(page).to have_content  @current_user.name
      click_on @current_user.name
      expect(page).to have_content "Edit User"
      fill_in 'user_current_password', with: "ductoan"
      click_on 'Update'
      expect(page).to have_content "Your account has been updated successfully."
    end

  end

end