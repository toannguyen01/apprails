require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validate' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:sku) }
  end
  describe 'associa' do
    it { should belong_to(:category) }
    it { should have_many(:order_items) }
  end
  describe 'content_strip_html' do
    let! (:product) { create(:product, description: '<p>text</p>') }
    it 'validates description strip html' do
      expect(product.description).to eq('text')
    end
  end
end  