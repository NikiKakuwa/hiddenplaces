Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  get 'posts/about' => "posts#about"

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :posts do
    resources :comments , only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
  get 'posts/new' => "posts#new"
  root 'posts#top'
end
