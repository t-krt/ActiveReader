Rails.application.routes.draw do
  root 'top#index'
  devise_for :users
  
  resources :users, only: [:index] do
    member do 
      get :reading, :read, :stock
    end
    resources :tasks, only: [:index, :new, :create]
  end

  resources :reviews, only: [:index, :new, :edit, :show]
  
  resources :books, only: :show do
    get :search, on: :collection
  end
end
