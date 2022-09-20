//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .


$('.arrow').delay(1000).queue(function(next){
  $(this).addClass('move');
  next();
})