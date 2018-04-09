require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe '#index' do
    it 'has a 200 status' do 
      expect(response.status).to eq(200)
    end

    let!(:products) { create_list(:product, 2)}
    it 'get a list of products' do
      get :index
      expect(assigns(:products).first).to eq products.last
      expect(assigns(:products).last).to eq products.first
    end

    it ' render template index' do
      get :index
      expect(response).to render_template("index")
    end


  end

  describe '#show' do
    let!(:product) { create(:product) }
    it 'render template show ' do
      get :show, params: { id: product.id }
      expect(response).to render_template("show")
    end
  end


end