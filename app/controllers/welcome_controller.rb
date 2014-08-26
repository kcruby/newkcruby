class WelcomeController < ApplicationController
  require 'net/http'
  require 'json'

  def index
  	@meetup = JSON.parse(meetup)
  end



	def meetup
		url = URI.parse('http://api.meetup.com/2/events?status=upcoming&order=time&limited_events=False&group_urlname=kcruby&desc=false&offset=0&photo-host=public&format=json&page=20&fields=&sig_id=149131642&sig=b0c1431c098b9665c479451539a165368a9fd796')
		req = Net::HTTP::Get.new(url.to_s)
		res = Net::HTTP.start(url.host, url.port) {|http|
		  http.request(req)
		}
		return res.body
	end

end
