
$(function(){

   $(document).ready(function(){

       var form = $('form');

       var changePassword = $('a.change-password', form);
       var existingPassword = $('div.form-field.existing-password', form);
       var passwordContainer = $('div.set-password', form);

       changePassword.click(function(){
           existingPassword.hide();
           passwordContainer.show();
       });

   });

});