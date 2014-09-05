class WelcomeController < ApplicationController
  require 'net/http'
  require 'json'

  def index
  	@meetup = JSON.parse(meetup)
    @meetup_members = JSON.parse(meetup_members)
  end


  def meetup_members
    url = URI.parse('http://api.meetup.com/2/groups?radius=25.0&order=id&desc=false&member_id=149131642&offset=0&photo-host=public&format=json&page=500&fields=&sig_id=149131642&sig=7919c54d53e92b1d5d77ed18931a5a155a8ac476')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    return res.body
  end


  def meetup
  	url = URI.parse('http://api.meetup.com/2/events?status=upcoming&order=time&limited_events=False&group_urlname=kcruby&desc=false&offset=0&photo-host=public&format=json&page=20&fields=&sig_id=149131642&sig=b0c1431c098b9665c479451539a165368a9fd796')
  	req = Net::HTTP::Get.new(url.to_s)
  	res = Net::HTTP.start(url.host, url.port) {|http|
  	  http.request(req)
  	}
  	return res.body
  end

	def gm_api_key
    "AIzaSyATeCy88iCOqi_TdWAb8EJ1WavvGHP2e1c"
  end


end
