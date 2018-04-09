require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe '#index' do
    it 'has a 200 status' do 
      expect(response.status).to eq(200)
    end

    it 'render template index' do 
      get :index     
      expect(response).to render_template("index")      
    end

  end


end