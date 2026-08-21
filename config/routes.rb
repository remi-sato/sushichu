Rails.application.routes.draw do
  root "sushis#index"
  
  resources :sushis, only: [:index, :show]
  resources :order_items, only: [:create, :update, :destroy]
  resource :cart, only: [:show, :update], controller: :orders

  namespace :kitchen do
    resources :orders, only: [:index, :update]
  end
  
end
