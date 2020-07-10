Rails.application.routes.draw do
  root "projects#index"
  resources :tasks, only: [:index, :new, :create]
end
