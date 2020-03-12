Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'users/show'
  get '/posts/search', to: 'posts#search'
  devise_for :users
  root to: 'posts#index'
  resources :posts
  resources :users, only: :show
end
