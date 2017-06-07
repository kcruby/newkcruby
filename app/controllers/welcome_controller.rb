class WelcomeController < ApplicationController

  def index
   #@meetup_members    = MeetupClient.members
    @meetup_members_results = MeetupClient.members['results'] || []
   #@meetup_past_total = MeetupClient.past_total
    @meetup_past_total_results = MeetupClient.past_total['results'] || []
   #@events = Event.all
   @events = Event.all rescue []

  end


  def create
    if params['email'].present? && params['email'].include?('@')

      options = {
        body: {
          email: params['email'],
          token: ENV['SLACK_TOKEN']
        }
      }

      response = HTTParty.post("https://kcruby.slack.com/api/users.admin.invite", options)
      if response.parsed_response["error"]
        flash[:notice] = "Oops, there was an error"
      end
    end

    redirect_to success_path
  end

end
