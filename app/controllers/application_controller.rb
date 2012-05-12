class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def login?
    code = params[:code]
    if code
      true
    else
      nil
    end
  end

  def oauth
    client = facebook_client
    redirect_to client.authorize_url
  end

  def facebook_client
    FacebookOAuth::Client.new(
      :application_id     => CONSUMER_KEY,
      :application_secret => CONSUMER_SECRET,
      :callback           => CALLBACK_URL
    )
  end

end
