function getExpenseReports() {
	$.ajax({
	    url: 'https://www.concursolutions.com/api/v3.0/expense/reportdigests?callback=?',
	    headers:{'Authorization':'Oauth MQHO89lqHVPrMtHTtLF3CAaf0Co='}
	})
	.done(function(data){
		alert(data);
	});
}

submitLocation = function() {
	location = $('#input-location').val();

}

$(function() {

	//get expense reports (here for now)
	//expenseReports = getExpenseReports();

    //add listener
    $('#submit-location-button').click(submitLocation);
});