Rails.application.routes.draw do
  root 'home#index'

  get 'mypage' => 'home#mypage'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :cosmetics, only: %i[index show]

  resources :carts, only: %i[create index destroy]

  resources :orders, only: %i[create show index] do
    resources :payments, only: %i[create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
