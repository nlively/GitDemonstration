OauthServer::Application.routes.draw do

  resources :check_ins, :only => [:index, :create]
  resources :locations

  devise_for :users

  get "home/index"
  match "myappredirect" => 'home#myappredirect'
  match "after_oauth" => 'home#index'

  mount Doorkeeper::Engine => '/oauth'
  match "/oauth/authorize", :via => :get, :to => "authorization#new"
  match "/oauth/authorize", :via => :post, :to => "authorization#create"

  root :to => "home#index"

end
