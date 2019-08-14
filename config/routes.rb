Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles do
    resources :comments, only: [:create, :update, :destroy]
  end

  delete '/logout', to: 'sessions#destroy'
end