module Conference_information
  # Get twilio-ruby from twilio.com/docs/ruby/install
  require 'twilio-ruby'

  # Get your Account SID and Auth Token from twilio.com/console
  account_sid = 'Sid'
  auth_token = 'your_auth_token'

  # Initialize Twilio Client
  @client = Twilio::REST::Client.new(account_sid, auth_token)

  @conference = @client.api.conferences('conference id')
                       .fetch

  puts @conference.status

end
