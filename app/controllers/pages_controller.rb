class PagesController < ApplicationController
  def home
  end
  
def twill
  require 'twilio-ruby'
  
    @client = Twilio::REST::Client.new(
      ENV[TWILIO_ACCOUNT_SID],
      ENV[TWILIO_AUTH_TOKEN])
    message1 = @client.account.messages.create(:body => "Hello from ruby",
    :to => "7812344622",
    :from =>"8574073135")
  
  puts message1.sid
  
end

  def sms
    @number = params[:q]
    @message = params[:d]
  
  require 'twilio-ruby'
  
  account_sid= "AC9ace702bb5d2a2e7a1848a8bc03112a8"
  auth_token = "ea2aaacff1c373fae94835898ba63077"
  
  
    @client = Twilio::REST::Client.new account_sid, auth_token
    message1 = @client.account.messages.create(:body => @message,
    :to => @number,
    :from =>"8574073135")
  
  puts message1.sid
    
  end
end
