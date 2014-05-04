function getExpenseReports() {
	$.ajax({
	    url: 'https://www.concursolutions.com/api/v3.0/expense/reportdigests?callback=?',
	    headers:{'Authorization':'Oauth MQHO89lqHVPrMtHTtLF3CAaf0Co='}
	})
	.done(function(data){
		alert(data);
	});
}

$(function() {
});
