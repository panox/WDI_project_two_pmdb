$(function(){

  $( '#movie-reviews' ).hide();
  $( "#movie-reviews-btn" ).click(function() {
    event.preventDefault();
    $( '#movie-reviews' ).slideToggle();
  })
  $('#movie-reviews-btn').focus(function() {
      this.blur();
  });
})