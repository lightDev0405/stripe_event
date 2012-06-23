require 'spec_helper'

describe StripeEvent::WebhookController do
  before do
    @base_params = { :use_route => :stripe_event }
  end
  
  context "with invalid event data" do
    let(:event_id) { 'evt_invalid_id' }
    
    before do
      stub_event(event_id, 404)
    end
    
    it "should deny access" do
      post :event, @base_params.merge(:id => event_id)
      response.code.should == '401'
    end
  end
end
