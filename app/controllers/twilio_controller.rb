
class TwilioController < ApplicationController
  require 'twilio-ruby'
  skip_before_action :verify_authenticity_token

  def voice
    response = Twilio::TwiML::VoiceResponse.new do |r|
      r.say("Yay! You're on Rails!", voice: "alice")
      r.play(loop: 10, url: 'https://api.twilio.com/cowbell.mp3')
    end
    render :xml => response.to_xml
  end
end
