require 'json'

class WelcomeController < ApplicationController
  include HTTParty
  before_action :require_sign_in, only: :admin
  before_action :authorize_user, only: :admin

  def index
  end

  def about
  end

  def new
    response = HTTParty.get("https://api.instagram.com/v1/users/self/media/recent/?access_token=" + Figaro.env.TWITTER_ACCESS_TOKEN )
    @instagrams = response["data"]
  end

  def submissions
  end

  def contact
  end

  def admin

  end

  private

  def authorize_user
    unless current_user.role == 'admin'
      flash[:alert] = "You must be an admin to do that."
      redirect_to index_path
    end
  end
end
