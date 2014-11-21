class Event < HashThing

  def event_date
    Time.at(time/1000.0)
  end

  def self.all
    MeetupClient.calendar["results"].map { |e| Event.new e }
  end

  def venue
    the_subject['venue'] ? Venue.new(the_subject['venue']) : nil
  end

end
