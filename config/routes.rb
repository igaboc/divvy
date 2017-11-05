Rails.application.routes.draw do
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

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
