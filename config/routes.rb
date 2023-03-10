Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#home"
  get 'about', to: "pages#about"
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :articles # AUTOMATICALLY GENERATES ALL ABOVE ROUTES

  get "signup", to: "users#new"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  # post "users", to: "users#create"
  resources :users, except: [:new]
  resources :categories, except: [:destroy]
end
