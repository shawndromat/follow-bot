require 'twitter'

class MentorsController < ApplicationController
  before_action :authenticate_user!

  def index
    client = Twitter::REST::Client.new(
      consumer_key: ENV['TWITTER_API_KEY'],
      consumer_secret: ENV['TWITTER_API_SECRET'],
      access_token: session[:token],
      access_token_secret: session[:secret],
    )

    @users = client.user_search('shawna tang')
  end
end
