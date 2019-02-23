Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "user/registrations",
    omniauth_callbacks: "callbacks"
  }
  resources :rides, only: [:index, :show] do
    member do
      get :contact
    end
  end
  scope module: :rides do
    resources :rides, only: [] do
      resources :requests, only: [:index, :show, :create]
    end
  end
  namespace :account do
    resource :validation, only: [:edit, :update]
    resources :rides
  end

  root 'rides#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
