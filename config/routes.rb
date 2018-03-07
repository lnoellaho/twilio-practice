Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'twilio/voice' => 'twilio#voice'
  get 'twilio/conference' => 'twilio#conference'
  get 'twilio/conference' => 'twilio#index'
  get 'twilio/room' => 'twilio#room'
end
