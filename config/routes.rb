Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
  resources :customers, only: [:index] do
    member do 
      get '/', to: 'customers#index'
    end
  end
end
