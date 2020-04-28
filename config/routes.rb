Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  get 'posts/about' => "posts#about"
  resources :posts
  resources :users
  resources :posts do
    resources :comments , only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
  get 'posts/new' => "posts#new"
  root 'posts#top'
end
