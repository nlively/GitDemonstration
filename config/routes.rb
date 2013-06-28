BoomrDashboard::Application.routes.draw do





  # SUPERUSER ADMIN PAGES
  match 'admin2' => 'admin2#index'
  namespace :admin2 do
    resources :agency, :only => [:new, :create]
  end

  # RAILS_ADMIN GEM PAGES
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'


  #resources :check_ins, :only => [:index, :create]

  # WEB SERVICE API
  namespace :api do



    namespace :v1 do
      resources :photos, :only => :show
      resources :visits, :only => :show
      resources :account, :only => [:index]
      resources :check_ins, :only => [:create]
      resources :work_breaks, :only => [:create]

      namespace :in_home do
        get 'employees'
        get 'visits'
      end

      namespace :session do
        post 'photo'
        post 'activities'
        post 'client-status', :action => :client_status
        post 'observations'
      end

      namespace :general do
        # deprecated pages as of app release 1.1.4
        get 'client_statuses'
        get 'daily_activities'
        get 'observations'

        # current pages
        get 'list_data'
        post 'keepalive'
      end

      post 'account' => 'account#update'
      post 'account/password'
      get 'account/visits'
      get 'account/visits/completed' => 'account#visits_completed'
      get 'account/clients'
      get 'account/photos'

      get 'employees/:id' => 'employees#show'
      get 'employees/:id/visits' => 'employees#visits'
      get 'employees/:id/photos' => 'employees#photos'

      get 'care-recipients/:id' => 'care_recipients#show'
      get 'care-recipients/:id/visits' => 'care_recipients#visits'
      get 'care-recipients/:id/photos' => 'care_recipients#photos'
      post 'care-recipients/:id/photo' => 'care_recipients#update_photo'

      post 'geo/clients'

    end
  end


  # ADMIN DASHBOARD
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
        resources :credit_cards, :except => [:show]
        match 'credit_cards/:id/set_default' => 'credit_cards#set_default', :as => :credit_cards_set_default
      end

      get 'users' => 'users#index'

      namespace :users do
        get 'upgrade' => 'upgrade#index'
        post 'upgrade' => 'upgrade#index_submit'

        namespace :upgrade do
          get 'summary'
          post 'summary', :action => :summary_submit
          get 'error'
          #match 'payment'
        end
      end

      resources :agency_invoices, :only => [:index, :show], :path => :invoices, :as => :invoices
      resources :agency_invoice_payments, :only => [:index, :show], :path => :payments, :as => :payments

      resources :daily_activities, :except => [:show]

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
        get 'invoices/:id/view' => 'invoices#view', :as => :invoice_view

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

    resources :clients, :only => [:show] do
      resources :locations, :except => [:show], :controller => 'clients/locations' do
        match 'make_default'
      end
    end

  end

  match 'dashboard' => 'dashboard#index'
  match 'dashboard/feed/activity_since' => 'dashboard#activity_since'
  match 'dashboard/feed/activity_before' => 'dashboard#activity_before'

  # SIGN IN AND REGISTRATION PAGES
  devise_for :users
  devise_for :care_recipients

  # OAUTH STUFF
  post "oauth/token", :to => "tokens#create"
  mount Doorkeeper::Engine => '/oauth'
  match "/oauth/authorize", :via => :get, :to => "authorization#new"
  match "/oauth/authorize", :via => :post, :to => "authorization#create"

  # PUBLIC PAGES
  match 'features' => 'home#features'
  match 'pricing' => 'home#pricing'
  match 'benefits' => 'home#benefits'
  get 'contact' => 'home#contact'
  post 'contact' => 'home#contact_submit'
  match 'terms' => 'home#terms'
  match 'about' => 'home#about'
  match 'faq' => 'home#faq'
  match 'apps' => 'home#apps'

  # PUBLIC WEBSITE SIGNUP WORKFLOW
  get "sign-up" => 'signup#index', :as => :signup
  post "sign-up" => 'signup#index_submit', :as => :signup
  get "sign-up/setup" => 'signup#setup', :as => :signup_setup
  post "sign-up/setup" => 'signup#setup_submit', :as => :signup_setup
  get "sign-up/confirm" => 'signup#confirm', :as => :signup_confirm
  get "sign-up/thanks" => 'signup#thanks', :as => :signup_thanks

  # ROOT PATH
  root :to => "home#index"

end
