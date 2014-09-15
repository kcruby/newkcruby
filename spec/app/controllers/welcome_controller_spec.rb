require_relative '../../spec_helper'

describe WelcomeController do

  let(:controller) { WelcomeController.new }

  describe "the index action" do

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

    end

  end

end
