require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associa' do
    it { should have_many(:order_items)}
  end  

  describe 'order' do
    let!(:order) { create(:order) }
    it 'status order' do
      expect(order.order_status).to eq "In Progress"
    end
  end
end