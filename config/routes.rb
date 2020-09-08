Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
  resources :customers, only: [:index, :new, :create] do
    member do 
      get '/', to: 'customers#index'
      post '/', to: 'customers#create'
    end
  end
end
