
//= require jquery.equalheights.js
//= require_tree ./dashboard/.


$(function(){
  $(document).ready(function(){
    $('.main-col').equalHeights(600, 3000);
  });

  if ($('body.dashboard.invoices.index').length > 0) {
    var selector = $('.filter-field.selector select');

    function updateFieldSelectors() {
      $('.filter-field:not(.selector)').hide();

      switch(selector.val()) {
        case 'client_name':
          $('.filter-field.client').css('display', 'inline-block');
          break;
        case 'invoice_number':
          $('.filter-field.invoice-number').css('display', 'inline-block');
          break;
        case 'invoice_date':
          $('.filter-field.date').css('display', 'inline-block');
          break;
        case 'invoice_status':
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