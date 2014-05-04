require 'net/http'
require 'json'
require 'rest-client'


class StaticPagesController < ApplicationController

  def getExpenseEntries(responseReports)
  	#takes in a list of expense report json objects
  	expenseEntryList = Array.new
  	responseReports.each do |reportJson|
  		#logger.debug("reportJSON: #{reportJson}")
  		reportId = reportJson['ID']
  		#logger.debug("reportId: #{reportId}")
  		#https://www.concursolutions.com/api/expense/expensereport/v2.0/report/EBE35F97898140B1B2F5
  		response = RestClient.get "https://www.concursolutions.com/api/expense/expensereport/v2.0/report/#{reportId}", { 'Authorization' => "Oauth MQHO89lqHVPrMtHTtLF3CAaf0Co=", "accept" => "application/json"}
  		#logger.debug("repord entry response: #{response}")
  		responseJson = JSON.parse(response)
  		entries = responseJson['ExpenseEntriesList'].split(",")

  		entries.each do |entry|
  			#logger.debug("entry 0: #{entry[0]}")
  			expenseEntryList.push(entry[0].to_s)
  		end

  		
  	end
  	return expenseEntryList

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

	expenseEntriesList = getExpenseEntries(responseReports)
	expenseEntriesStr = expenseEntriesList.join(",")

	#logger.debug("exense entries: #{expenseEntriesStr}")

	@expenseEntries = "{\"entries\": [#{expenseEntriesStr}] }"


	logger.debug(@expenseEntries)


  end

  def help
  end
end
