Rails.application.routes.draw do
  root 'top#index'
  devise_for :users
  
  resources :users, only: [:index] do
    member do 
      get :reading, :read, :stock
    end
    resources :tasks, only: [:index]
  end

  resources :tasks, except: [:index, :show] do
    get :finish, on: :member
  end
  resources :reviews
  
  resources :books, only: :show do
    get :search, on: :collection
  end
end
