class WelcomeController < ApplicationController


  def index
      @meetup            = MeetupClient.calendar
      @meetup_members    = MeetupClient.members
      @meetup_past_total = MeetupClient.past_total
  end


end