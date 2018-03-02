module Conference_information
  # Get twilio-ruby from twilio.com/docs/ruby/install
  require 'twilio-ruby'

  # Get your Account SID and Auth Token from twilio.com/console
  account_sid = 'ACb74c519d16b0a17c2c0cf8aaa2dd41b1'
  auth_token = 'your_auth_token'

  # Initialize Twilio Client
  @client = Twilio::REST::Client.new(account_sid, auth_token)

  @conference = @client.api.conferences('CFbbe46ff1274e283f7e3ac1df0072ab39')
                       .fetch

  puts @conference.status
  
end
