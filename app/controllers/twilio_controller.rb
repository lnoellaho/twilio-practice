
class TwilioController < ApplicationController
  require 'twilio-ruby'
  skip_before_action :verify_authenticity_token

  def index

  end

  def voice
    response = Twilio::TwiML::VoiceResponse.new do |r|
      r.say("Yay! You're on Rails!", voice: "alice")
      r.play(loop: 10, url: 'https://api.twilio.com/cowbell.mp3')
    end
    render :xml => response.to_xml
  end

  def conference
    response = Twilio::TwiML::VoiceResponse.new
    response.gather(input: 'dtmf', timeout: 10, numDigits: 4, action:'/twilio/room') do |gather|
      gather.say('Please enter your four digit pin.')
    end
    render :xml => response.to_xml
  end

  def room
    response = Twilio::TwiML::VoiceResponse.new
    pin = params["Digits"]
    if pin == '1234'
      response.dial do |dial|
        response.say('You are in Leeann\'s room')
        dial.conference('Room 1', waitUrl: 'http://twimlets.com/holdmusic?Bucket=com.twilio.music.classical')
      end
    elsif pin == '5678'
      response.dial do |dial|
        response.say('You are in kevin\'s room')
        dial.conference('Room 2')
      end
    elsif pin == '9876'
      response.dial do |dial|
        response.say('You are in Christina\'s room')
        dial.conference('Room 3')
      end
    end
    response.say('Invalid pin number')
    response.redirect('/twilio/conference', method: 'POST')
    # else
    #   response.say('You are not in a room')
    # end
    render :xml => response.to_xml
  end

end
