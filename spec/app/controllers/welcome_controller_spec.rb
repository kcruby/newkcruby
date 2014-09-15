require_relative '../../spec_helper'

describe WelcomeController do

  let(:controller) { WelcomeController.new }

  describe "the index action" do

    before do
      stub_request(:any, 'http://api.meetup.com/2/events?status=upcoming&order=time&limited_events=False&group_urlname=kcruby&desc=false&offset=0&photo-host=public&format=json&page=20&fields=&sig_id=149131642&sig=b0c1431c098b9665c479451539a165368a9fd796')
        .to_return(body: {}.to_json)
      stub_request(:any, 'http://api.meetup.com/2/groups?group_id=575011&radius=25.0&order=id&desc=false&offset=0&photo-host=public&format=json&page=500&fields=&sig_id=149131642&sig=2c3394f2573d80a5db423cd17683052bb35ba9fb')
        .to_return(body: {}.to_json)
      stub_request(:any, 'http://api.meetup.com/2/events?group_id=575011&status=past&order=time&limited_events=False&desc=false&offset=0&photo-host=public&format=json&page=500&fields=&sig_id=149131642&sig=66cf2eab7cf84735622c5fdd774120f0ef20fd0b')
        .to_return(body: {}.to_json)
    end

    [
      { 'a' => 'b' }, 
      { 'c' => 'd' }, 
    ].each do |example|

      describe "multiple examples" do

        it "should pass the meetup data to the view" do

          stub_request(:any, 'http://api.meetup.com/2/events?status=upcoming&order=time&limited_events=False&group_urlname=kcruby&desc=false&offset=0&photo-host=public&format=json&page=20&fields=&sig_id=149131642&sig=b0c1431c098b9665c479451539a165368a9fd796').
            to_return(:body => example.to_json)

          controller.index

          controller.instance_eval { @meetup }.must_equal example
            
        end

      end

      describe "multiple examples" do

        it "should pass the meetup member data to the view" do

          stub_request(:any, 'http://api.meetup.com/2/groups?group_id=575011&radius=25.0&order=id&desc=false&offset=0&photo-host=public&format=json&page=500&fields=&sig_id=149131642&sig=2c3394f2573d80a5db423cd17683052bb35ba9fb').
            to_return(:body => example.to_json)

          controller.index

          controller.instance_eval { @meetup_members }.must_equal example
            
        end

      end


      describe "multiple examples" do

        it "should pass the meetup member data to the view" do

          stub_request(:any, 'http://api.meetup.com/2/events?group_id=575011&status=past&order=time&limited_events=False&desc=false&offset=0&photo-host=public&format=json&page=500&fields=&sig_id=149131642&sig=66cf2eab7cf84735622c5fdd774120f0ef20fd0b').
            to_return(:body => example.to_json)

          controller.index

          controller.instance_eval { @meetup_past_total }.must_equal example
            
        end

      end

    end

  end

end
