class EvernoteController < ApplicationController

  def evernote_export
    if params[:oauth_verifier]
      @result = "Yay: " + params[:oauth_verifier]  
      authtoken = params[:oauth_verifier]
      @client = EvernoteOAuth::Client.new(token: authtoken)
    else  
      client = EvernoteOAuth::Client.new
      request_token = client.request_token(:oauth_callback => 'http://localhost:3000/evernote_export')
      request_token.authorize_url
      @result = request_token.authorize_url
    redirect_to @result 

    end
  end
  
  
end