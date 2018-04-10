require 'rails_helper'

describe 'View History', type: :feature do
    let!(:user) { create(:user, email: "ductoannguyen02@gmail.com", password: "ductoan") }
    let!(:product) { create(:product) }    
    let!(:order) { create(:order, user_id: user.id)}
    let!(:order_item) { create(:order_item, order_id: order.id, product_id: product.id) }
    it 'view history order not finished' do
      current_user = user
      visit new_user_session_path
      expect(page).to have_content "Log in"
      fill_in 'user_email', with: "ductoannguyen02@gmail.com"   
      fill_in 'user_password', with: "ductoan" 
      click_on 'Log in'   
      expect(page).to have_content "Signed in successfully."       
      click_on 'History Order'
      expect(page).to have_content order.id
      click_link 'info order'
      expect(page).to have_content 'Checkout'
    end

    context 'view history order finished' do
      let!(:order) { create(:order, user_id: user.id, finished: true)}
      it 'finished' do
        current_user = user
        visit new_user_session_path
        expect(page).to have_content "Log in"
        fill_in 'user_email', with: "ductoannguyen02@gmail.com"   
        fill_in 'user_password', with: "ductoan" 
        click_on 'Log in'   
        expect(page).to have_content "Signed in successfully."       
        click_on 'History Order'
        expect(page).to have_content order.id
        click_link 'info order'
        expect(page).to have_content 'This order finished !!!'
      end
    end
end