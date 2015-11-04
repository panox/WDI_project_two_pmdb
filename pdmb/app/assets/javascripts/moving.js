$(function(){

  $( '#movie-reviews' ).hide();
  $( "#movie-reviews-title" ).click(function() {
    event.preventDefault();
    $( '#movie-reviews' ).slideToggle();
  })

})