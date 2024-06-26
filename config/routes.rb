Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :items do
    resources :purchases, only: [:index, :create, :new]
  end

  resources :purchases, only: [:show, :update]
  resources :users, only: [:show]

  get 'dashboard', to: 'pages#dashboard', as: :dashboard
end
