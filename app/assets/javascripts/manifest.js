$(document).ready(function() {
	$('#intention').on("mouseenter", ".jumbotron", function() {
		$(this).find('.btn-lg').slideToggle();
	});
	$('#intention').on("mouseleave", ".jumbotron", function() {
		$(this).find('.btn-lg').slideToggle();
	});

	$(window).scroll(function(){
  $('.inner').toggleClass('scrolling', $(window).scrollTop() > $('#wizards').offset().top);
});

	
});



