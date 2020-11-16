Rails.application.routes.draw do
  get 'carts/create'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # get "cosmetics" => "cosmetics#index"
  # get "cosmetics/:id" => "cosmetics/show"
  resources :cosmetics, only: [:index, :show]

  resources :carts, only: [:create, :index, :destroy]

  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
