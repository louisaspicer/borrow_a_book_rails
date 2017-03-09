Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :books do
    resources :comments
    resources :requests
  end

  get 'profile', to: 'users#show'

  root to: "books#index"

end
