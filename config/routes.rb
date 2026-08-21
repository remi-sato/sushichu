Rails.application.routes.draw do
  root "sushis#index"
  
  resources :sushis, only: [:index, :show]
  resources :order_items, only: [:create, :update, :destroy]
  resource :cart, only: [:show, :update], controller: :orders
  
end
