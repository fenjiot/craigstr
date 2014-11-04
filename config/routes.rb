Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :regions, only: [:index, :new, :show, :create, :update, :delete] do
    resources :posts, only: [:index, :new, :create, :show]
    resources :categories, only: [:index, :new, :create, :show]
  end

  root "posts#index"
end
