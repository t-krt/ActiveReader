Rails.application.routes.draw do
  root 'top#index'
  devise_for :users
  resources :users, only: [:index] do
    resources :tasks, only: [:index, :new, :create]
  end
  resources :reviews
  resources :books, only: :show do
    get :search, on: :collection
  end

  get 'users/:id/reading', to: 'users#reading', as: :reading
  get 'users/:id/read', to: 'users#read', as: :read
  get 'users/:id/stock', to: 'users#stock', as: :stock
end
