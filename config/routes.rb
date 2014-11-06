Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :regions, only: [:index, :new, :show, :create, :update, :destroy] do
    resources :posts
    resources :categories, only: [:index, :new, :create, :show]
  end

  root "regions#index"
end
