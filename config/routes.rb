Yhblog::Application.routes.draw do

  
  get "log_in" => "sessions#new", :as => "log_in"
  
  get "log_out" => "sessions#destroy", :as => "log_out"
  
  get "sign_up" => "users#new", :as => "sign_up" 
  
  resources :sessions, :only => [:new, :create, :destroy]

  root :to => "main#index"
  
  namespace :admin do
    resources :posts, :users
  end
  
  namespace :user do
    resource :membership_info, only: [:show, :edit, :update], controller: :membership 
  end
  
  namespace :author do
    resources :posts
  end
  
  resources :posts do
    resources :comments
  end
end
