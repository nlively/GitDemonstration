$(document).ready(function(){

  if ($('body.sign-up.index').length > 0) {

    var servicePlanMore = $('#service-plan-more');
    var disclaimer = $('#submit-agreement');
    var updateDisplay = function() {
      if (servicePlanMore.is(':checked')) {
        disclaimer.show();
      }
      else {
        disclaimer.hide();
      }
    };


    $('input:radio[name="service_plan"]').click(function(){ updateDisplay(); });

    updateDisplay();

  }

});