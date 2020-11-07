Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :cosmetics, only: [:index, :show]

  # get "cosmetics" => "cosmetics#index"
  # get "cosmetics/:id" => "cosmetics/show"

  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
