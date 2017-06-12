class HoursController < ApplicationController
  before_action :require_sign_in, except: :show
  before_action :authorize_user, except: :show

  def index
    @hours = Hour.all
  end

  def show
    @hour = Hour.last
    @hour.title.upcase!

  end

  def new
    @hour = Hour.new
  end

  def create
    @hour = Hour.new
    @hour.title = params[:hour][:title]
    @hour.body = params[:hour][:body]

    if @hour.save
      redirect_to admin_path
    else
      flash[:alert] = 'error saving hours'
    end
  end

  def edit
    @hour = Hour.last
  end

  def update
    @hour = Hour.last
    @hour.title = params[:hour][:title]
    @hour.body = params[:hour][:body]

    if @hour.save
      redirect_to admin_path
    else
      flash[:alert] = 'error saving hours'
    end
  end

  private

  def authorize_user
    unless current_user.role == 'admin'
      flash[:alert] = "You must be an admin to do that."
      redirect_to index_path
    end
  end
end
