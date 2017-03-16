class PagesController < ApplicationController
  
  def home
  end

  def sms
    @number = params[:q] #taking the number
    @message = params[:d]
  
  
  require 'twilio-ruby'
  
  
  #this was my second attempt at environment variable my first used unix commands and .bashrc but ultimately
  #was unable to get rid of a "unitialized constant" error message
  
  account_sid = ENV["TWILIO_ACCOUNT_ID"]  #environmental variables where made from figaro gem
  auth_token = ENV["TWILIO_AUTHORIZE_TOKEN"] #these variables are found in the application.yml file
  
    @client = Twilio::REST::Client.new account_sid, auth_token

    message1 = @client.account.messages.create(:body => @message, #taking the message and phone parameters and using 
    :to => @number,                                               #and using them as the text message itself and the recipient
    :from =>"8574073135") #my authorized twilio number
  
  puts message1.sid
  end
end
