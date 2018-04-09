require 'rails_helper'

RSpec.describe OrderItem, type: :model do

  describe 'associations' do
    it { should belong_to(:product) }
    it { should belong_to(:order) }    
  end

  describe 'custom validate' do

    context 'product nil' do
      let!(:order_item) { build(:order_item, product_id: nil)}
      it ' product present ' do
        order_item.validate
        expect(order_item.errors.messages).to include(:product => ["must exist", "is not valid or is not active."])              
      end
    end

    context 'order nil' do
      let!(:order_item) { build(:order_item, order_id: nil)}
      it ' order present' do
        order_item.validate
        expect(order_item.errors.messages).to include(:order=>["must exist", "is not a valid order."])
      end
    end

  end



end