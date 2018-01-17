Rails.application.routes.draw do


  #get 'feedbacks/new'

  get 'sessions/new'
  

  get 'users/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'feedbacks#new'
  get  '/signup',  to: 'users#new'
  get  '/root',    to: 'static_pages#home'
  get  '/login',    to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'    
  post '/signup',  to: 'users#create'
  post '/ticket' , to: 'tickets#create'
  get  '/ticket' ,  to: 'tickets#new'
  #get  '/feedback'  to: 'feedbacks#new'
  post  '/contact',  to: 'feedbacks#create'
  get   '/feedback', to:  'feedbacks#index'
  #get   '/users',   to: 'users#index'
  
  resources :users do
    member do
      get :following, :followers
    end
  end


 resources :account_activations, only: [:edit]
  resources :microposts,         only: [:create, :destroy]
   resources :relationships,       only: [:create, :destroy]
   
end
