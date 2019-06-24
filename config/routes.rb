Rails.application.routes.draw do
  root 'top#index'
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :tasks, only: [:index, :new, :create]
  end
  resources :reviews, only: [:new, :create, :edit, :show]
  resources :books, only: :show do
    get :search, on: :collection
  end
end


# TODO taskの内容？