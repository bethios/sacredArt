class EventsController < ApplicationController
  before_action :require_sign_in, except: :index
  before_action :authorize_user, except: :index

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.title = params[:event][:title]
    @event.date = params[:event][:date]
    @event.body = params[:event][:body]

    if @event.save
      flash[:notice] = "Event was saved."
      redirect_to events_path
    else
      flash.now[:alert] = "There was an error saving the event. Please try again."
      render :new
    end
  end

  def update
    @event = Event.find(params[:id].to_i)
    @event.title = params[:event][:title]
    @event.date = params[:event][:date]
    @event.body = params[:event][:body]

    if @event.save
      flash[:notice] = "Event was updated."
      redirect_to events_path
    else
      flash.now[:alert] = "There was an error updating the event. Please try again."
      render :edit
    end
  end

  def edit
    @event = Event.find(params[:id].to_i)
  end

  def destroy
    @event = Event.find(params[:id].to_i)

    if @event.destroy
      flash[:notice] = "\"#{@event.title}\" was deleted successfully."
      redirect_to events_path
    else
      flash.now[:alert] = "There was an error deleting the event."
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
end
