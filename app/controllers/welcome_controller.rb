class WelcomeController < ApplicationController

  def index
    @meetup_members    = MeetupClient.members
    @meetup_past_total = MeetupClient.past_total
    @events = Event.all
  end

end
