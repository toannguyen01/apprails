require 'rails_helper'
require 'paypal-sdk-rest'


RSpec.describe OrdersController, type: :controller do

  describe '#show' do
    it 'has a 200 status' do 
      expect(response.status).to eq(200)
    end

    let!(:order) { create(:order) }
    it 'render template show' do 
      get :show, params: { id: order.id }
      expect(response).to render_template("show")      
    end

  end



end