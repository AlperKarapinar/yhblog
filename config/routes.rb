Yhblog::Application.routes.draw do

  
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up" 
  
  get "about" => "about", controller: :about, :as => "about" 
  get "contact" => "contact", contoller: :contact, :as => "contact" 

  get "autocomplete_tag_name" => "author/posts#autocomplete_tag_name", :as => "autocomplete_tag_name"
  
  get "search" => "main#search", :as => "search"
  
  resources :sessions, :only => [:new, :create, :destroy]

  root :to => "main#index"
  
  namespace :admin do
    resources :posts, :users, :categories
  end
    
  namespace :user do
    resource :membership_info, only: [:show, :edit, :update], controller: :membership 
    resource :dashboard, only: [:show], controller: :dashboard
  end
  
  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index], controller: :author_posts
  end
  
  namespace :author do
    resources :posts, as: :myposts, controller: :posts do
      get :autocomplete_tag_name, :on => :collection
      resources :comments, only: :destroy
    end
  end
  resources :posts do
    resources :comments
  end
  resources :categories do
    resources :posts, controller: :category_posts, only: [:index, :show]
  end
  namespace :tag do
    resources :posts, only: [:index], controller: :tags
  end
  
end
