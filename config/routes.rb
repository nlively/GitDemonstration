OauthServer::Application.routes.draw do

  get "general/client_statuses"

  get "general/daily_activities"

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

      namespace :general do
        get 'client_statuses'
        get 'daily_activities'
      end

      post 'account' => 'account#update'
      post 'account/password'
      get 'account/visits'
      get 'account/visits/completed' => 'account#visits_completed'
      get 'account/clients'
      get 'account/notes'
      get 'account/photos'

      get 'care-recipients/:id' => 'care_recipients#show'
      get 'care-recipients/:id/visits' => 'care_recipients#visits'
      get 'care-recipients/:id/notes' => 'care_recipients#notes'
      get 'care-recipients/:id/photos' => 'care_recipients#photos'

      post 'geo/clients'

    end
  end

  namespace :dashboard do

    match 'search', :action => :feed_search_filter

    resources :employees, :only => [:index, :show, :new, :create, :update, :destroy]
    resources :clients, :only => [:index, :show, :new, :create, :update, :destroy]

    match 'visits' => 'visits#index'
    match 'reports' => 'reports#index'
    match 'settings' => 'settings#index'
    match 'observations' => 'observations#index'

    namespace :settings do
      get 'agency' => 'agency#index'
      post 'agency' => 'agency#update'

      namespace :agency do
        get 'subscription'
        post 'subscription', :action => :subscription_update

        match 'subscription/change_to/:id', :action => :subscription_change, :as => :subscription_change
      end

      get 'users' => 'users#index'
    end

    namespace :reports do
      get 'payroll' => 'payroll#index'
      get 'billing' => 'billing#index'

      namespace :payroll do
        resources :batches, :except => [:edit]
      end
      namespace :billing do
        resources :batches, :except => [:edit]
      end
    end

    namespace :visits do
      match 'custom'
      match 'today'
      match 'this-week', :action => :this_week, :as => :this_week
      match 'this-month', :action => :this_month, :as => :this_month
    end

    get 'visits/:id' => 'visits#show_visit',   :as => :visit
    get 'visits/:id/edit' => 'visits#edit_visit',   :as => :edit_visit
    post 'visits/:id/approve' => 'visits#approve_visit',   :as => :approve_visit
    put 'visits/:id' => 'visits#update_visit', :as => :visit

    post 'employees/search' => 'employees#search', :as => :employees_search
    namespace :employees do
      match ':id/profile' => 'profile#index', :as => :profile
      match ':id/clients' => 'clients#index', :as => :clients
      match ':id/notes' => 'notes#index', :as => :notes
      match ':id/notes/:note_id' => 'notes#show', :as => :note
      match ':id/visits' => 'visits#index', :as => :visits
      match ':id/payroll' => 'payroll#index', :as => :payroll


      get ':id/delete', :action => :delete, :as => :delete
      get ':id/freeze', :action => :freeze, :as => :freeze
      post ':id/freeze', :action => :freeze_update, :as => :freeze
      get ':id/unfreeze', :action => :unfreeze, :as => :unfreeze
      post ':id/unfreeze', :action => :unfreeze_update, :as => :unfreeze
      get ':id/reset-password', :action => :reset_password, :as => :reset_password
      post ':id/reset-password', :action => :reset_password_update, :as => :reset_password

    end

    post 'clients/search' => 'clients#search', :as => :clients_search
    #put 'clients/:id' => 'clients#update'
    namespace :clients do
      match ':id/profile' => 'profile#index', :as => :profile
      match ':id/caregivers' => 'caregivers#index', :as => :caregivers
      match ':id/notes' => 'notes#index', :as => :notes
      match ':id/notes/:note_id' => 'notes#show', :as => :note
      match ':id/visits' => 'visits#index', :as => :visits
    end

  end

  match 'dashboard' => 'dashboard#index'
  match 'dashboard/activity_since' => 'dashboard#activity_since'

  devise_for :users

  get "home/index"

  mount Doorkeeper::Engine => '/oauth'
  match "/oauth/authorize", :via => :get, :to => "authorization#new"
  match "/oauth/authorize", :via => :post, :to => "authorization#create"

  root :to => "home#index"

end
