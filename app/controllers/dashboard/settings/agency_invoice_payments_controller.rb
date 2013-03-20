module Dashboard::Settings
  class AgencyInvoicePaymentsController < Dashboard::SettingsController

    before_filter do
      @page_type = :payments
    end

    # GET /dashboard/settings/payments
    def index
      @page_title = 'Payment History'
      @payments = @agency.agency_invoice_payments.order('date desc, id desc')
    end

    # GET /dashboard/settings/payments/:id
    def show
      @payment = AgencyInvoicePayment.find params[:id]
      @page_title = 'Invoice Payment ' + @payment.agency_invoice.id.to_s
    end


  end
end
