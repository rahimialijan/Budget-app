Rails.application.routes.draw do
  get 'home/landing'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :groups, only: [:index, :show, :new, :create] do
    resources :entities, only: [:new, :create]
  end
  root 'home#landing'

end
