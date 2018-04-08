Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :products
  resources :categories do
    resources :products
  end
  resources :orders do
    member do
     get 'payment'
     get 'execute'
    end
  end  
  resources :order_items, only: [:create, :update, :destroy]
  resource :cart, only: [:show]
  resources :histories
  root "pages#index"
end
