require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe '#index' do
    it 'has a 200 status' do 
      expect(response.status).to eq(200)
    end

    let!(:categories) { create_list(:category, 5)}
    it 'render template index' do 
      get :index      
      expect(response).to render_template("index")
      expect(assigns(:categories).first).to eq categories.last
      expect(assigns(:categories).last).to eq categories.first      
    end

  end

  describe '#show' do
    let!(:category) { create(:category)}
    it 'show category' do
      get :show, params: { id: category.id}
      expect(response).to render_template("show")
    end
  
  end

end