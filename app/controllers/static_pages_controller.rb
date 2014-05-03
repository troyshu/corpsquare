require 'net/http'
require 'json'
require 'rest-client'


class StaticPagesController < ApplicationController
  def home


 #  	authorization = 'Oauth MQHO89lqHVPrMtHTtLF3CAaf0Co='
 #  	get all reports
 #  	url = URI.parse("https://www.concursolutions.com/api/v3.0/expense/reportdigests/?#{authorization}")
	# req = Net::HTTP::Get.new(url.path)
	# res = Net::HTTP.start(url.host, url.port) {|http|
	#  http.request(req)
	# }
	# logger.debug(res.body)

	response = RestClient.get 'https://www.concursolutions.com/api/v3.0/expense/reportdigests/', { 'Authorization' => "Oauth MQHO89lqHVPrMtHTtLF3CAaf0Co=" }

	reportdigests = JSON.parse(response)
	logger.debug("REPORT DIGESTS: #{reportdigests}")

  end

  def help
  end
end
