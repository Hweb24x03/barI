# -*- encoding: UTF-8 -*-

class UsersController < ApplicationController
  CALLBACK_URL    = "http://localhost:3000/users/callback"
  CONSUMER_KEY    = "429142240431394"
  CONSUMER_SECRET = "f84dbfdd85dd1d84ea193dd27616e5ff"

  def index
  end

  def oauth
    client = FacebookOAuth::Client.new(
      :application_id     => CONSUMER_KEY,
      :application_secret => CONSUMER_SECRET,
      :callback           => CALLBACK_URL
    )
    redirect_to client.authorize_url
  end

  def callback
    @client = FacebookOAuth::Client.new(
      :application_id     => CONSUMER_KEY,
      :application_secret => CONSUMER_SECRET,
      :callback           => CALLBACK_URL
    )
    @client.authorize(:code => params[:code])
  end
end
