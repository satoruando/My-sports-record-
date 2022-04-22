$(document).on('turbolinks:load', function() {
  console.log('script.js');
  $('.top-title').hide();
  $('.top-title').fadeIn(3000);

});