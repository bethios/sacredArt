class EventsController < ApplicationController
  before_action :require_sign_in, except: :index
  before_action :authorize_user, except: :index
  before_action :find_event, only: [:update, :edit, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    if @event.update_attributes(event_params)
      flash[:notice] = "Event was saved."
      redirect_to events_path
    else
      flash.now[:alert] = @event.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @event.update_attributes(event_params)
      flash[:notice] = "Event was updated."
      redirect_to events_path
    else
      flash.now[:alert] = @event.errors.full_messages.to_sentence
      render :edit
    end
  end

  def edit
  end

  def destroy
    if @event.destroy
      flash[:notice] = "\"#{@event.title}\" was deleted successfully."
      redirect_to events_path
    else
      flash.now[:alert] = @event.errors.full_messages.to_sentence
      render events_path
    end
  end

  def index
    @events = Event.all
  end

  def authorize_user
    unless current_user.role == 'admin'
      flash[:alert] = "You must be an admin to do that."
      redirect_to index_path
    end
  end

  def find_event
    @event = Event.find(params[:id].to_i)
  end

  def event_params
    params.require(:event).permit(:title, :date, :body)
  end
end
