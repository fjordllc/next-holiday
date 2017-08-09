$(function(){
  $('#js-background-image').imagesLoaded( { background: true }, function() {
	$('#js-background-image').addClass('is-active');
  });
});
