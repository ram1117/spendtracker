Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
  resources :users, only: [:index] do
    resources :categories, only: %i[index new create show] do
      resources :spendings, only: %i[new create]
    end
  end
end
