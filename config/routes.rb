Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
  get :index_creator, to: "users#index_creator"
  get :get_events, to: "events#get_events"
  get :show_user, to: "users#show_user"
  resources :events
  resources :attendaces
  # get "events/new", to: "events#new"
  # post "events/create", to: "events#create"
  post :attendaces_create,to: "attendaces#create"
  delete :attendaces_destroy,to: "attendaces#destroy"
end
