Rails.application.routes.draw do
  devise_for :users
  resources :photos
  resources :listings do
    put :favorite, on: :member
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
