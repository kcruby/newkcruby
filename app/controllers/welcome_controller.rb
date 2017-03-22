class WelcomeController < ApplicationController

  def index
   #@meetup_members    = MeetupClient.members
    @meetup_members_results = MeetupClient.members['results'] || []
   #@meetup_past_total = MeetupClient.past_total
    @meetup_past_total_results = MeetupClient.past_total['results'] || []
   #@events = Event.all
   @events = Event.all rescue []
  end

end
