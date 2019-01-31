Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  resources :rides, only: [:index, :show]
  namespace :account do
    resources :rides
  end

  root 'rides#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
