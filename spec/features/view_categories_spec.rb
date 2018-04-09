require 'rails_helper'

describe 'View Category', type: :feature do
  let!(:category) { create(:category) }

  it 'index' do
    visit categories_path
    expect(page).to have_content category.title

  end
  
end