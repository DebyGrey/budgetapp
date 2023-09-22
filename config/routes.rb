Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    resources :homes do
      resources :transactions, only: [:new, :create]
    end
    root "homes#index", as: :authenticated_root
  end

  root "splashscreens#index" # This is the root route for unauthenticated users

  # Other routes...
end
