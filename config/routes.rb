Rails.application.routes.draw do

  devise_for :users
  root 'dresses#index'
  resources :dresses
  get '/about', to: 'pages#about', as: 'about_us'
  get '/contact', to: 'pages#contact', as: 'contact_us'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
