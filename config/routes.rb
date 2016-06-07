Rails.application.routes.draw do

  devise_for :users, skip: [:registrations, :passwords]

  resources :users

  resources :product_categories

  resources :products

  resources :manage_products do
    put 'to_state'
  end

  resources :customers

  resources :orders do
    get 'update/state', to: 'orders#edit_state', as: :edit_state
    put 'update/:state', to: 'orders#update', as: :update_state
  end

  root to: 'home#index'

end
