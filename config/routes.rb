Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    resources :categories do
      resources :expenses, only: [:new, :create]
    end
    root "categories#index", as: :authenticated_root
  end

  root "splashscreens#index"
end
