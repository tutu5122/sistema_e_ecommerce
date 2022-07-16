Rails.application.routes.draw do

  resources :colors
  get 'home/index'

  resource :cart, only: %i[ update show ]

  devise_for :users
  devise_for :admins

  authenticate :admin do
    resources :products
    resources :categories
  end

  root 'home#index'
end
