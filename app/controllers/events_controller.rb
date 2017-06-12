class EventsController < ApplicationController
  before_action :require_sign_in, except: :index
  before_action :authorize_user, except: :index

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def authorize_user
    unless current_user.role == 'admin'
      flash[:alert] = "You must be an admin to do that."
      redirect_to index_path
    end
  end
end
