Rails.application.routes.draw do
  root "projects#index"
  resources :projects, only: [:new, :create, :show] do
    resources :tasks, only: [:index, :new, :create]
  end
end
