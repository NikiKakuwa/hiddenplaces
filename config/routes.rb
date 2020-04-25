Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users
  resources :posts do
    resources :comments , only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
  get 'users/about' => "users#about"
  get 'posts/new' => "posts#new"
  root 'users#top'
end
