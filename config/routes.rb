Rails.application.routes.draw do

  resources :users, only: [:showroom ]do
    resources :reviews, module: :users
  end

  get 'users/showroom', to: 'users#showroom', as: 'user'

  devise_for :users 
  root 'dresses#index'
  resources :dresses do 
    resources :reviews, module: :dresses
  end

  get '/about', to: 'pages#about', as: 'about_us'
  get '/contact', to: 'pages#contact', as: 'contact_us'
  resources :transactions, only: [:create]
  get 'checkout/success', to: 'transactions#success', as: 'checkout_successful'
  get 'checkout/cancel', to: 'transactions#cancel', as: 'checkout_canceled'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
