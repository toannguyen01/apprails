require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do

  def current_order
    Order.find(session[:order_id])
    order = Order.create(order_status_id: 1)
    session[:order_id] = order.id
  end

  describe '#create' do
    let!(:order_item) { create(:order_item) }
    it 'create' do  
      expect(order_item).to be_valid
    end
  end


end