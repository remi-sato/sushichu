Rails.application.routes.draw do
  root "sushis#index"
  
  resources :sushis, only: [:index, :show]
  resources :order_items, only: [:create, :update, :destroy]
  resource :cart, only: [:show, :update], controller: :orders
  resources :orders, only: [:index]

  namespace :kitchen do
    resources :orders, only: [:index]
    resources :order_items, only: [:update]
  end
  
end
