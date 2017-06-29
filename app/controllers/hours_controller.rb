class HoursController < ApplicationController
  before_action :require_sign_in, except: :show
  before_action :authorize_user, except: :show
  before_action :find_hour, only: [:update, :edit, :show]


  def index
    @hours = Hour.all
  end

  def show
    @hour.title.upcase!
  end

  def new
    @hour = Hour.new
  end

  def create
    @hour = Hour.new

    if @hour.update_attributes(hour_params)
      redirect_to admin_path
    else
      flash[:alert] = 'Error saving hours.'
    end
  end

  def edit
  end

  def update
    if @hour.update_attributes(hour_params)
      redirect_to admin_path
    else
      flash[:alert] = 'Error saving hours.'
    end
  end

  private

  def authorize_user
    unless current_user.role == 'admin'
      flash[:alert] = "You must be an admin to do that."
      redirect_to index_path
    end
  end

  def find_hour
    @hour = Hour.last
  end

  def hour_params
    params.require(:hour).permit(:title, :body)
  end
end
