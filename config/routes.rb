Rails.application.routes.draw do
  root "projects#index"
  resources :projects do
    resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
