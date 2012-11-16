OauthServer::Application.routes.draw do

  

  

  

  

  

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :check_ins, :only => [:index, :create]

  namespace :api do
      namespace :v1 do
        resources :photos, :only => :create
        resources :notes, :only => :create
        resources :account, :only => :index
        resources :care_recipients, :only => :show
        resources :check_ins, :only => [:create, :index]

        match 'account/password', :via => :post
        get 'account/history'

        get 'care-recipients/:id' => 'care_recipients#show'
        get 'care-recipients/:id/history' => 'care_recipients#history'

        match 'geo/clients', :via => [:get, :post]

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
