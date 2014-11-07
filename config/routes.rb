class AdminConstraint
  def matches?(request)
    warden = request.env["warden"]
    warden.user.present? && warden.user.admin?
  end
end

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :regions, only: [:index, :new, :show, :create, :update, :destroy] do
    resources :posts do
      resources :spams, only: [:create]
    end
    resources :categories, only: [:index, :new, :create, :show]
  end

  namespace :admin, constraints: AdminConstraint.new do
    resources :regions, :posts, :categories

    root "admin#index"
  end

  root "regions#index"
end
