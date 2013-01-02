$(document).ready(function(){
  $('select:not(.selectbox-processed)').each(function(){
    var selectbox = $('<div class="selectbox"></div>');
    var text = $('<div class="text"></div>');
    var span = $('<span></span>');
    var select = $(this);

    select.wrap(selectbox);

    console.log(this);


    select.after(text);
    text.append('<em></em>');
    text.append(span);

    span.text(this.options[this.selectedIndex].text);

    select.change(function(){
      span.text(this.options[this.selectedIndex].text);
    });

    $(this).addClass('selectbox-processed');
  });
});