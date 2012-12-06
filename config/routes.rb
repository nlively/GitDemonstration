OauthServer::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :check_ins, :only => [:index, :create]

  namespace :api do
    namespace :v1 do
      resources :photos, :only => :show
      resources :notes, :only => :show
      resources :visits, :only => :show
      resources :account, :only => [:index]
      resources :check_ins, :only => [:create]

      namespace :session do
        post 'photo'
        post 'note'
      end

      post 'account' => 'account#update'
      post 'account/password'
      get 'account/history'
      get 'account/clients'
      get 'account/notes'

      get 'care-recipients/:id' => 'care_recipients#show'
      get 'care-recipients/:id/history' => 'care_recipients#history'
      get 'care-recipients/:id/notes' => 'care_recipients#notes'
      get 'care-recipients/:id/photos' => 'care_recipients#photos'

      match 'geo/clients', :via => [:get, :post]

    end
  end

  namespace :dashboard do
    resources :locations

    match 'visits' => 'visits#index'
    match 'employees' => 'employees#index'
    match 'clients' => 'clients#index'
    match 'reports' => 'reports#index'
    match 'settings' => 'settings#index'

    namespace :employees do
      match ':id/profile' => 'profile#index', :as => :profile
      match ':id/clients' => 'clients#index', :as => :clients
      match ':id/notes' => 'notes#index', :as => :notes
      match ':id/visits' => 'visits#index', :as => :visits
      match ':id/payroll' => 'payroll#index', :as => :payroll
    end

    namespace :clients do
      match ':id/profile' => 'profile#index', :as => :profile
      match ':id/caregivers' => 'caregivers#index', :as => :caregivers
      match ':id/notes' => 'notes#index', :as => :notes
      match ':id/visits' => 'visits#index', :as => :visits
    end

  end

  match 'dashboard' => 'dashboard#index'

  devise_for :users

  get "home/index"

  mount Doorkeeper::Engine => '/oauth'
  match "/oauth/authorize", :via => :get, :to => "authorization#new"
  match "/oauth/authorize", :via => :post, :to => "authorization#create"

  root :to => "home#index"

end
