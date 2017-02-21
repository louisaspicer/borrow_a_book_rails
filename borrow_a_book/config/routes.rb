Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :books do
    resources :comments
  end

  root to: "books#index"

end
