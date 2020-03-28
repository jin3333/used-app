Rails.application.routes.draw do
  root "posts#index"
  get 'tags/:tag', to: 'posts#index', as: :tag
  devise_for :users
  resources :users, only: [:index,:edit, :update, :show, :new, :create]
  resources :posts, only: [:index,:new,:edit, :update,:create,:show,:destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
     collection do
    get 'search'
  end
end
  resources :relationships, only: [:create, :destroy]
end
