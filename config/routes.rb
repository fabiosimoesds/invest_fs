Rails.application.routes.draw do
  root to: "companies#index"

  resources :companies do
    collection do
      get 'list'
    end
  end

  resources :lists, only: [:show, :new, :create, :edit, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
