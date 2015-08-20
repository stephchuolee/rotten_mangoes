RottenMangoes::Application.routes.draw do

  get 'movies/search'
  
  resources :movies do 
    resources :reviews, only: [:new, :create]
  end 

  namespace :admin do 
    resources :users
  end 

  resources :users, only: [:new, :create, :show]
  resource :session

  root to: 'movies#index'
  
end
