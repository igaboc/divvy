Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :photos
  resources :listings do
    resources :reviews, except: [:show, :index]
    put :favorite, on: :member
    resources :rentals, only: [:index, :show, :new, :create, :update, :edit]
  end

  resources :profiles
  get 'home/index'
  root :to => 'home#index'
  resources :conversations do
    resources :messages
  end

  get '/support' => 'support#new'
  post '/support' => 'support#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
