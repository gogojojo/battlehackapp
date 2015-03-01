class EventsController < ApplicationController
  before_action :authorize
  def index 
    @events = Event.all
  end
  def show
    @event = Event.find(params[:id])
  end
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to '/'
    else
      render :new
    end
  end
  def edit 
    @event = Event.find(params[:id])
  end
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event.id)
    else 
      render :edit
    end
  end
  def destroy 
    @event = Event.find(params[:id])

    @event.destroy
    redirect_to '/'
  end
  def addparticipants
    @event = Event.find(params[:id])
    if @event.participants === nil
      @event.participants =[]
      @event.participants << current_user.id
    else
      @event.participants << current_user.id
    end
    if @event.save
      redirect_to event_path(@event.id)
    end
  end
  def deleteparticipant
    @event = Event.find(params[:id])
  end
  private
  def event_params
    params.require(:event).permit(:title, :description, :cost, :date, :user_id, :participants, :event)
  end
end
