# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  # navigation.selected_class = 'your_selected_class'

  # Specify the class that will be applied to the current leaf of
  # active navigation items. Defaults to 'simple-navigation-active-leaf'
  # navigation.active_leaf_class = 'your_active_leaf_class'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # If you need to add custom html around item names, you can define a proc that will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  # navigation.name_generator = Proc.new {|name| "<span>#{name}</span>"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation
  navigation.items do |primary|
    # Add an item to the primary navigation. The following params apply:
    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
    # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
    # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
    #           some special options that can be set:
    #           :if - Specifies a proc to call to determine if the item should
    #                 be rendered (e.g. <tt>:if => Proc.new { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>:unless => Proc.new { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
    #                            when the item should be highlighted, you can set a regexp which is matched
    #                            against the current URI.  You may also use a proc, or the symbol <tt>:subpath</tt>. 
    #
    primary.item :admin, 'Admin', rails_admin_path, :if => Proc.new{ !current_user.nil? and current_user.has_role? :administrator }

    # Add an item which has a sub navigation (same params, but with block)
    primary.item :dashboard, 'Dashboard', dashboard_path, :if => Proc.new{ !current_user.nil? }, :highlights_on => :subpath do |sub_nav|
      # Add an item to the sub navigation (same params again)
      sub_nav.item :home, 'Home', dashboard_path do |home|
        home.item :live_feed, 'Live Feed', dashboard_feed_path, :highlights_on => :subpath
      end
      sub_nav.item :clients, 'Clients', dashboard_clients_path, :highlights_on => :subpath  do |client|
        if @care_recipient.blank? or @care_recipient.id.blank?
          client.item :new_client, 'Add a New Client', new_dashboard_client_path, :highlights_on => :subpath
        else
          client.item :employee, @care_recipient.try(:full_name), dashboard_clients_profile_path(@care_recipient), :highlights_on => /dashboard\/clients\/[0-9]+/ do |client_sub|
            client_sub.item :profile, 'Profile', dashboard_clients_profile_path(@care_recipient), :highlights_on => :subpath
            client_sub.item :caregivers, 'Assigned Caregivers', dashboard_clients_caregivers_path(@care_recipient), :highlights_on => :subpath
            client_sub.item :visits, 'Visits', dashboard_clients_visits_path(@care_recipient), :highlights_on => :subpath
            #client_sub.item :notes, 'Notes/Photos', dashboard_clients_notes_path(@care_recipient), :highlights_on => :subpath do |note_sub|
            #  unless @note.blank?
            #    note_sub.item :view, 'View Note', dashboard_clients_note_path(@care_recipient, @note), :highlights_on => :subpath
            #  end
            #end
          end
        end
      end
      sub_nav.item :employees, 'Employees', dashboard_employees_path, :highlights_on => :subpath  do |employee|
        unless @employee.blank? or @employee.id.blank?
          employee.item :employee, @employee.try(:full_name), dashboard_employees_profile_path(@employee), :highlights_on => /dashboard\/employees\/[0-9]+/ do |emp_sub|
            emp_sub.item :profile, 'Profile', dashboard_employees_profile_path(@employee), :highlights_on => :subpath
            emp_sub.item :clients, 'Clients', dashboard_employees_clients_path(@employee), :highlights_on => :subpath
            emp_sub.item :visits, 'Visits', dashboard_employees_visits_path(@employee), :highlights_on => :subpath
            #emp_sub.item :notes, 'Notes/Photos', dashboard_employees_notes_path(@employee), :highlights_on => :subpath do |note_sub|
            #  unless @note.blank?
            #    note_sub.item :view, 'View Note', dashboard_employees_note_path(@employee, @note), :highlights_on => :subpath
            #  end
            #end
            emp_sub.item :payroll, 'Payroll', dashboard_employees_payroll_path(@employee), :highlights_on => :subpath
          end
        else
          employee.item :new_employee, 'Add a New Employee', new_dashboard_employee_path, :highlights_on => :subpath
        end
      end
      sub_nav.item :visits, 'Visits', dashboard_visits_path, :highlights_on => :subpath do |visit|
        visit.item :custom, 'Custom View', dashboard_visits_custom_path, :highlights_on => :subpath
        visit.item :today, 'Today', dashboard_visits_today_path, :highlights_on => :subpath
        visit.item :this_week, 'This Week', dashboard_visits_this_week_path, :highlights_on => :subpath
        visit.item :this_month, 'This Month', dashboard_visits_this_month_path, :highlights_on => :subpath
      end
      sub_nav.item :reports, 'Billing and Payroll', dashboard_reports_path, :highlights_on => :subpath do |report|
        report.item :billing, 'Billing', dashboard_reports_billing_path, :highlights_on => :subpath do |billing|
          billing.item :create_invoices, 'Create Invoices', new_dashboard_reports_billing_invoice_path, :highlights_on => %r(/invoices/(new|pending))
          billing.item :search, 'Search Invoices', dashboard_reports_billing_invoices_path, :highlights_on => %r(/invoices$)
        end
        report.item :payroll, 'Payroll', dashboard_reports_payroll_path, :highlights_on => :subpath do |payroll|
          payroll.item :create_batch, 'Create Payroll Batch', new_dashboard_reports_payroll_batch_path, :highlights_on => %r(/batches/(new|pending))
          payroll.item :search, 'Search Batches', dashboard_reports_payroll_batches_path, :highlights_on => %r(/batches(\/search)?$)
        end
      end
      sub_nav.item :settings, 'Settings', dashboard_settings_path, :highlights_on => :subpath do |settings|
        settings.item :agency, 'Agency', dashboard_settings_agency_path, :highlights_on => :subpath
        settings.item :users, 'Users', dashboard_settings_users_path, :highlights_on => :subpath
      end
    end

    # You can also specify a condition-proc that needs to be fullfilled to display an item.
    # Conditions are part of the options. They are evaluated in the context of the views,
    # thus you can use all the methods and vars you have available in the views.

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    # primary.dom_class = 'menu-class'

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false

  end

end
