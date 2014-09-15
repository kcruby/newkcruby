module MeetupClient

  def self.members
    make_web_request 'http://api.meetup.com/2/groups?group_id=575011&radius=25.0&order=id&desc=false&offset=0&photo-host=public&format=json&page=500&fields=&sig_id=149131642&sig=2c3394f2573d80a5db423cd17683052bb35ba9fb'
  end

  def self.calendar
    make_web_request 'http://api.meetup.com/2/events?status=upcoming&order=time&limited_events=False&group_urlname=kcruby&desc=false&offset=0&photo-host=public&format=json&page=20&fields=&sig_id=149131642&sig=b0c1431c098b9665c479451539a165368a9fd796'
  end

  def self.past_total
    make_web_request 'http://api.meetup.com/2/events?group_id=575011&status=past&order=time&limited_events=False&desc=false&offset=0&photo-host=public&format=json&page=500&fields=&sig_id=149131642&sig=66cf2eab7cf84735622c5fdd774120f0ef20fd0b'
  end

  def self.make_web_request url
    uri      = URI.parse url
    request  = Net::HTTP::Get.new uri.to_s
    response = Net::HTTP.start(uri.host, uri.port) { |h| h.request request }
    JSON.parse response.body
  end

end
