class Event < HashThing

  def event_date
    Time.at(time/1000.0)
  rescue
    nil
  end

  def description
    the_subject['description'].present? ? the_subject['description'] : "No description"
  end

  def url
    "http://www.meetup.com/kcruby/events/#{id}"
  end

  def formatted_month
    event_date.strftime("%B")
  rescue
    nil
  end

  def formatted_year
    event_date.strftime("%Y")
  rescue
    nil
  end

  def formatted_day_as_number
    event_date.strftime("#{event_date.day.ordinalize}")
  rescue
    nil
  end

  def formatted_day_as_string
    event_date.strftime("%A")
  end

  def formatted_begin_hour
     event_date.strftime("%-I")
  rescue
    nil
  end

  def formatted_end_hour
    dur = Time.at((time/1000)+(duration/1000))
    dur.strftime("%-I")
  rescue
    nil
  end

  def name
    the_subject['name'].present? ? the_subject['name'] : '?'
  end

  def self.all
    MeetupClient.calendar["results"].map { |e| Event.new e }
  end

  def venue
    return Venue.new(HashWithIndifferentAccess.new({ name: 'darrens', address_1: '554 W Layton St', city: 'Olathe', state: 'KS' }))
    the_subject['venue'] ? Venue.new(the_subject['venue']) : nil
  end

  def venue_name
    event.venue.name || "?"
  end

end
