Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories do
    resources :products
  end
  resources :products
  resources :order_items, only: [:create, :update, :destroy]
  resource :cart, only: [:show]
  root "pages#index"
end
