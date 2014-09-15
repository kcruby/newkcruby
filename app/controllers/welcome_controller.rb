class WelcomeController < ApplicationController
  #require 'net/http'
  #require 'json'

  def index
  	@meetup = JSON.parse(meetup)
    #@meetup_members = JSON.parse(meetup_members)
    #@meetup_past_total = JSON.parse(meetup_past_total)
  end


  #def meetup_members
    #url = URI.parse('http://api.meetup.com/2/groups?group_id=575011&radius=25.0&order=id&desc=false&offset=0&photo-host=public&format=json&page=500&fields=&sig_id=149131642&sig=2c3394f2573d80a5db423cd17683052bb35ba9fb')
    #req = Net::HTTP::Get.new(url.to_s)
    #res = Net::HTTP.start(url.host, url.port) {|http|
      #http.request(req)
    #}
    #return res.body
  #end

  #def meetup_past_total
    #url = URI.parse('http://api.meetup.com/2/events?group_id=575011&status=past&order=time&limited_events=False&desc=false&offset=0&photo-host=public&format=json&page=500&fields=&sig_id=149131642&sig=66cf2eab7cf84735622c5fdd774120f0ef20fd0b')
    #req = Net::HTTP::Get.new(url.to_s)
    #res = Net::HTTP.start(url.host, url.port) {|http|
      #http.request(req)
    #}
    #return res.body
  #end


  def meetup
  	url = URI.parse('http://api.meetup.com/2/events?status=upcoming&order=time&limited_events=False&group_urlname=kcruby&desc=false&offset=0&photo-host=public&format=json&page=20&fields=&sig_id=149131642&sig=b0c1431c098b9665c479451539a165368a9fd796')
  	req = Net::HTTP::Get.new(url.to_s)
  	res = Net::HTTP.start(url.host, url.port) {|http|
  	  http.request(req)
  	}
  	return res.body
  end

end
