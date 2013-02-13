OauthServer::Application.routes.draw do

  get "general/client_statuses"

  get "general/daily_activities"

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :check_ins, :only => [:index, :create]

  namespace :api do
    namespace :v1 do
      resources :photos, :only => :show
      resources :visits, :only => :show
      resources :account, :only => [:index]
      resources :check_ins, :only => [:create]

      namespace :session do
        post 'photo'
        post 'activities'
        post 'client-status', :action => :client_status
        post 'observations'
      end

      namespace :general do
        get 'client_statuses'
        get 'daily_activities'
        get 'observations'
      end

      post 'account' => 'account#update'
      post 'account/password'
      get 'account/visits'
      get 'account/visits/completed' => 'account#visits_completed'
      get 'account/clients'
      get 'account/photos'

      get 'care-recipients/:id' => 'care_recipients#show'
      get 'care-recipients/:id/visits' => 'care_recipients#visits'
      get 'care-recipients/:id/photos' => 'care_recipients#photos'
      post 'care-recipients/:id/photo' => 'care_recipients#update_photo'

      post 'geo/clients'

    end
  end

  #match 'dashboard/feed'
  #match 'dashboard/feed/filter/:type' => 'dashboard#feed_filter', :as => :dashboard_feed_filter

  namespace :dashboard do

   match 'feed'
   match 'feed/filter/:type', :action => :feed, :as => :feed_filter

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

        post 'batches/search' => 'batches#index'
        post 'batches/export/:id' => 'batches#export', :as => :export_batch
        get 'batches/export/:id/download' => 'batches#export_download', :as => :export_batch_download
        post 'batches/:id/status' => 'batches#status', :as => :batch_status
        get 'batches/:id/line-item/:line_item_id' => 'batches#line_item', :as => :batch_line_item
        put 'batches/:id/line-item/:line_item_id' => 'batches#update_line_item', :as => :batch_line_item
        get 'batches/:id/pending' => 'batches#pending', :as => :batch_pending

        resources :batches, :except => [:edit]
      end
      namespace :billing do

        post 'invoices/search' => 'invoices#index'
        get 'invoices/pending/:guid' => 'invoices#pending', :as => :pending_invoices
        post 'invoices/export' => 'invoices#export', :as => :export_invoices
        get 'invoices/export/batch/:guid' => 'invoices#export_batch', :as => :export_batch
        get 'invoices/export/:id' => 'invoices#export_individual', :as => :export_invoice
        post 'invoices/:id/status' => 'invoices#status', :as => :invoice_status

        resources :invoices
      end
    end

    namespace :visits do
      match 'custom'
      match 'today'
      match 'this-week', :action => :this_week, :as => :this_week
      match 'this-month', :action => :this_month, :as => :this_month
    end

    get 'visits/:id' => 'visits#show',   :as => :visit
    get 'visits/:id/edit' => 'visits#edit',   :as => :edit_visit
    post 'visits/:id/approve' => 'visits#approve',   :as => :approve_visit
    put 'visits/:id' => 'visits#update', :as => :visit

    post 'employees/search' => 'employees#search', :as => :employees_search
    namespace :employees do
      match ':id/profile' => 'profile#index', :as => :profile
      match ':id/clients' => 'clients#index', :as => :clients
      get ':id/clients/select' => 'clients#select_client', :as => :clients_select
      post ':id/clients/select' => 'clients#assign_client', :as => :clients_select
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
      get ':id/caregivers/select' => 'caregivers#select_caregiver', :as => :caregivers_select
      post ':id/caregivers/select' => 'caregivers#assign_caregiver', :as => :caregivers_select
      match ':id/visits' => 'visits#index', :as => :visits


    end

  end

  match 'dashboard' => 'dashboard#index'
  match 'dashboard/feed/activity_since' => 'dashboard#activity_since'
  match 'dashboard/feed/activity_before' => 'dashboard#activity_before'

  devise_for :users

  get "home/index"
  get 'terms' => 'home#terms'

  mount Doorkeeper::Engine => '/oauth'
  match "/oauth/authorize", :via => :get, :to => "authorization#new"
  match "/oauth/authorize", :via => :post, :to => "authorization#create"

  root :to => "home#index"

end
