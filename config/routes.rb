Rails.application.routes.draw do
  root 'home#index'

  get 'mypage' => 'home#mypage'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :cosmetics, only: %i[index show] do
    member do
      post '/comments' => 'cosmetics#create_comment'
    end
    collection do
      delete '/comments/:comment_id' => 'cosmetics#destroy_comment'
      patch '/comments/:comment_id' => 'cosmetics#update_comment'
    end
  end
  
  resources :sales, only: %i[index show]

  resources :carts, only: %i[create index destroy]

  resources :orders, only: %i[create show index destroy] do
    resources :payments, only: %i[create]
  end

  resources :news, only: %i[index show]

  resources :blogs, only: %i[index show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
