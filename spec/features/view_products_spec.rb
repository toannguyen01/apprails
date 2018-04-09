require 'rails_helper'

describe 'View Product', type: :feature do
  let!(:product) { create(:product) }

  it 'index and show' do
    visit products_path
    expect(page).to have_content product.name
    fill_in 'order_item[quantity]', with: 1   
    click_on 'Add to Cart'
    expect(page).to have_content "1 Items in Cart ( $12.00 )"
  end
  
end