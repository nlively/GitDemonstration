$(function(){

  $(document).ready(function(){

    var form = $('form');
    var individualWrapper = $('div.individual-wrapper', form);
    var companyWrapper = $('div.company-wrapper', form);
    var radios = $('input[name="care_recipient[is_company]"]', form);
    var companyRadio = $('#is-company-yes', form);

    var updateDisplay = function() {
      if (companyRadio.is(':checked')) {
        individualWrapper.hide();
        companyWrapper.show();
      }
      else {
        individualWrapper.show();
        companyWrapper.hide();
      }
    };

    radios.click(function(){
      updateDisplay();
    });


    updateDisplay();

  });

});