Ankr::Application.routes.draw do

  root 'intentions#index'
  get 'categories/art' => 'categories#art'
  get 'categories/sports' => 'categories#sports'
 

  get 'intentions/admin' => 'intentions#admin', :as => 'admin'
  delete 'intentions/admin/:wordid/:intentionid' => 'words#unlink', :as => 'unlink'
  resources :users, :intentions, :sessions, :matches, :suggestions, :categories, :bands



  get '/signup' => 'users#new'
  get '/signout' => 'sessions#destroy', via: :delete
  get '/signin' => 'sessions#new'

  post '/want_to/:id' => 'intentions#want_to', :as => 'want_to'




end


#   Prefix Verb   URI Pattern                    Controller#Action
#           root GET    /                              intentions#index
#          users GET    /users(.:format)               users#index
#                POST   /users(.:format)               users#create
#       new_user GET    /users/new(.:format)           users#new
#      edit_user GET    /users/:id/edit(.:format)      users#edit
#           user GET    /users/:id(.:format)           users#show
#                PATCH  /users/:id(.:format)           users#update
#                PUT    /users/:id(.:format)           users#update
#                DELETE /users/:id(.:format)           users#destroy
#     intentions GET    /intentions(.:format)          intentions#index
#                POST   /intentions(.:format)          intentions#create
#  new_intention GET    /intentions/new(.:format)      intentions#new
# edit_intention GET    /intentions/:id/edit(.:format) intentions#edit
#      intention GET    /intentions/:id(.:format)      intentions#show
#                PATCH  /intentions/:id(.:format)      intentions#update
#                PUT    /intentions/:id(.:format)      intentions#update
#                DELETE /intentions/:id(.:format)      intentions#destroy
# jared-computer:ankr jaredfishman$ 
