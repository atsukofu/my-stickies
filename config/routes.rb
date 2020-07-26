Rails.application.routes.draw do
  root "projects#index"
  resources :projects do
    resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :users, only: [:new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
end
