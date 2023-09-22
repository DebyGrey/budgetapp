Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    resources :categories, only: [:index, :new, :show] do
      resources :expenses, only: [:new, :create]
    end
     root "categories#index", as: :authenticated_root
  end

  root "splashscreens#index"

    # Define routes for categories and new_category here:
  resources :categories
  get 'new_category', to: 'categories#new'

end