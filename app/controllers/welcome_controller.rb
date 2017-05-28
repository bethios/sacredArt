require 'json'

class WelcomeController < ApplicationController
  include HTTParty

  def index
  end

  def about
  end

  def new
    response = HTTParty.get("https://api.instagram.com/v1/users/self/media/recent/?access_token=1501412006.1c07f10.9907313dd1db40ae86c0c9c1f61fe2d0")
    @instagrams = response["data"]
  end

  def faq
  end

  def submissions
  end

  def contact
  end
end
