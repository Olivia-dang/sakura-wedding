Rails.application.routes.draw do

  get 'users/showroom'
  devise_for :users
  root 'dresses#index'
  resources :dresses
  get '/about', to: 'pages#about', as: 'about_us'
  get '/contact', to: 'pages#contact', as: 'contact_us'
  resources :transactions, only: [:create]
  get 'checkout/success', to: 'transactions#success', as: 'checkout_successful'
  get 'checkout/cancel', to: 'transactions#cancel', as: 'checkout_canceled'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
