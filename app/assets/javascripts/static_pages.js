submitLocation = function() {
	location = $('#input-location').val();
	
}

$(function() {

    //add listener
    $('#submit-location-button').click(submitLocation);
});