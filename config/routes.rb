OauthServer::Application.routes.draw do

  resources :check_ins, :only => [:index, :create]

  namespace :api do
      namespace :v1 do
        resources :check_ins, :only => [:index, :create]
      end
    end

  namespace :dashboard do
    resources :locations
  end

  devise_for :users

  get "home/index"

  mount Doorkeeper::Engine => '/oauth'
  match "/oauth/authorize", :via => :get, :to => "authorization#new"
  match "/oauth/authorize", :via => :post, :to => "authorization#create"

  root :to => "home#index"

end
