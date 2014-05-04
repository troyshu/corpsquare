require 'net/http'
require 'json'
require 'rest-client'


class StaticPagesController < ApplicationController

  def getExpenseEntries(responseReports)
  	#takes in a list of expense report json objects
  	

  end

  def home


 #  	authorization = 'Oauth MQHO89lqHVPrMtHTtLF3CAaf0Co='
 #  	get all reports
 #  	url = URI.parse("https://www.concursolutions.com/api/v3.0/expense/reportdigests/?#{authorization}")
	# req = Net::HTTP::Get.new(url.path)
	# res = Net::HTTP.start(url.host, url.port) {|http|
	#  http.request(req)
	# }
	# logger.debug(res.body)

	response = RestClient.get 'https://www.concursolutions.com/api/v3.0/expense/reportdigests/', { 'Authorization' => "Oauth MQHO89lqHVPrMtHTtLF3CAaf0Co=", "accept" => "application/json"}

	responseReports = JSON.parse(response)["Items"]

	expenseEntries = getExpenseEntries(responseReports)


  end

  def help
  end
end
