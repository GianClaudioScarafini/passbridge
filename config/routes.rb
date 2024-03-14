Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :items do
    resources :purchases, only: [:create, :new]
  end

  resources :purchases, only: [:show, :update]
  resources :users, only: [:show]
  resources :purchase_proposals

  get 'dashboard', to: 'pages#dashboard', as: :dashboard
end
