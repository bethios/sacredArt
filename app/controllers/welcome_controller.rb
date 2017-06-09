require 'json'

class WelcomeController < ApplicationController
  include HTTParty

  def index
  end

  def about
  end

  def new
    response = HTTParty.get("https://api.instagram.com/v1/users/self/media/recent/?access_token=" + Figaro.env.TWITTER_ACCESS_TOKEN )
    @instagrams = response["data"]
  end

  def faq
  end

  def submissions
  end

  def contact
  end

  def categories

  end
end
