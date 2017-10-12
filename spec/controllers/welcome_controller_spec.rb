require 'rails_helper'

describe WelcomeController do

  let(:controller) { WelcomeController.new }

  describe "the index action" do

    before do
      MeetupClient.stubs(:members)
      MeetupClient.stubs(:calendar)
      MeetupClient.stubs(:past_total)
    end

    xit "should return the calendar data as 'meetup' to the view" do

      calendar_data = Object.new
      MeetupClient.stubs(:calendar).returns calendar_data

      controller.index

      controller.instance_eval { @meetup }.must_be_same_as calendar_data
        
    end

    xit "should return the members to the view" do

      members = Object.new
      MeetupClient.stubs(:members).returns members

      controller.index

      controller.instance_eval { @meetup_members_results }.must_be_same_as members
        
    end

    xit "should return the past totals to the view" do

      past_total = Object.new
      MeetupClient.stubs(:past_total).returns past_total

      controller.index

      controller.instance_eval { @meetup_past_total_results }.must_be_same_as past_total
        
    end


  end

end
