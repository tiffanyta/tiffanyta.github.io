
// A $( document ).ready() block.
$( document ).ready(function() {
	$( "#redbutton" ).click(function() {    
		console.log( "clicked" );
		$("#clickedthisone").removeClass("blue");
		$("#clickedthisone").addClass("red");

});
		$( "#bluebutton" ).click(function() {    
		console.log( "clicked" );
		$("#clickedthisone").removeClass("red");
		$("#clickedthisone").addClass("blue");

});
});