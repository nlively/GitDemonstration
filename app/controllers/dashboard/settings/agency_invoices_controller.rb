module Dashboard::Settings
  class AgencyInvoicesController < Dashboard::SettingsController

    before_filter do
      @page_type = :invoices
    end

    # GET /dashboard/settings/invoices
    def index
      @page_title = 'Invoices'
      @invoices = @agency.agency_invoices.order('invoice_date desc, id desc')
    end

    # GET /dashboard/settings/invoices/:id
    def show
      @invoice = AgencyInvoice.find params[:id]
      @page_title = 'Invoice ' + @invoice.invoice_number_formatted
    end


  end
end
