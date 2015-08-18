RottenMangoes::Application.routes.draw do
  resources :movies
  resources :users, only: [:new, :create]
  resources :sesions, only: [:new, :create]

end
