require 'spec_helper'

describe Notifiable::DeviceTokensController do
  
  let(:user1) { FactoryGirl.create(:user) }
  
  it "creates a new device token" do    
    post :create, :token => "ABC123", :user_id => user1.email, :provider => :apns
    Notifiable::DeviceToken.count.should == 1
    Notifiable::DeviceToken.first.user_id.should eql user1.email
  end
  
  it "updates user attributes" do    
    pending("update the test app to include first name/last name for user")
  end
  
end