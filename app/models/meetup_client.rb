require 'net/http'

module MeetupClient

  def self.members
    make_web_request "http://api.meetup.com/2/groups?group_id=575011&radius=25.0&order=id&desc=false&offset=0&photo-host=public&format=json&page=500&fields=&sign=true&key=#{ENV['API_KEY']}"
  end

  def self.calendar
    make_web_request "http://api.meetup.com/2/events?status=upcoming&order=time&limited_events=False&group_urlname=kcruby&format=json&page=20&fields=&sign=true&key=#{ENV['API_KEY']}"
  end

  def self.past_total
    make_web_request 'http://api.meetup.com/2/events?group_id=575011&status=past&order=time&limited_events=False&desc=false&offset=0&photo-host=public&format=json&page=500'
  end

  def self.make_web_request url
    uri      = URI.parse url
    request  = Net::HTTP::Get.new uri.to_s
    response = Net::HTTP.start(uri.host, uri.port) { |h| h.request request }
    JSON.parse response.body
  end
end
