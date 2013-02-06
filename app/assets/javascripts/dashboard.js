
//= require jquery.equalheights.js
//= require_tree ./dashboard/.


$(function(){
  $(document).ready(function(){
    $('.main-col').equalHeights(600, 3000);
  });

  if ($('body.dashboard.invoices.index, body.dashboard.batches.index').length > 0) {
    var selector = $('.filter-field.selector select');

    function updateFieldSelectors() {
      $('.filter-field:not(.selector)').hide();

      switch(selector.val()) {
        case 'client_name':
          $('.filter-field.client').css('display', 'inline-block');
          break;
        case 'employee_name':
          $('.filter-field.employee').css('display', 'inline-block');
          break;
        case 'invoice_number':
          $('.filter-field.invoice-number').css('display', 'inline-block');
          break;
        case 'batch_number':
          $('.filter-field.batch-number').css('display', 'inline-block');
          break;
        case 'invoice_date':
        case 'batch_date':
          $('.filter-field.date').css('display', 'inline-block');
          break;
        case 'invoice_status':
        case 'batch_status':
          $('.filter-field.status').css('display', 'inline-block');
          break;
      }
    }

    function filterFieldSelector_Change() {
      updateFieldSelectors();
    }

    selector.change(filterFieldSelector_Change);

    updateFieldSelectors();
  }
});