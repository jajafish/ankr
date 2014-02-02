Ankr::Application.routes.draw do

  root 'intentions#index'

  resources :users, :intentions


end
