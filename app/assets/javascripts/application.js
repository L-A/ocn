//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require_tree ../../../vendor/assets/javascripts/
//= require_tree .
//= require turbolinks

$(document).on('click', '.reply', function(e){
  $(this).prev().show();
});
