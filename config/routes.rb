Rails.application.routes.draw do
  root "sushis#index"
  
  resources :sushis, only: [:index, :show]
  
end
