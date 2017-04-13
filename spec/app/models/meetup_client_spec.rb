require_relative '../../rails_helper'

describe MeetupClient do

  describe "getting data from meetup" do

    [
      { 'a' => 'b' }, 
      { 'c' => 'd' }, 
    ].each do |example|

      describe "multiple examples" do

        it "should return the calendar data" do

          stub_request(:get, "http://api.meetup.com/2/events?fields=&format=json&group_urlname=kcruby&key=50325d6374347d2c7965503c220653&limited_events=False&order=time&page=20&sign=true&status=upcoming").
             with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
             to_return(:status => 200, :body => example.to_json, :headers => {})

          result = MeetupClient.calendar

          expect(result).to eq(example)
            
        end

        it "should return the member data" do

          stub_request(:get, "http://api.meetup.com/2/groups?desc=false&fields=&format=json&group_id=575011&key=50325d6374347d2c7965503c220653&offset=0&order=id&page=500&photo-host=public&radius=25.0&sign=true").
             with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
             to_return(:status => 200, :body => example.to_json, :headers => {})
             
          result = MeetupClient.members

          expect(result).to eq(example)
            
        end

        it "should return the past total data" do

          stub_request(:get, "http://api.meetup.com/2/events?desc=false&format=json&group_id=575011&limited_events=False&offset=0&order=time&page=500&photo-host=public&status=past").
            with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
            to_return(:status => 200, :body => example.to_json, :headers => {})
          result = MeetupClient.past_total

          expect(result).to eq(example)
            
        end

      end

    end

  end

end
