class EventsController < ApplicationController
  before_action :authorize
  def index 
    @events = Event.all
  end
  def show
    @event = Event.find(params[:id])
    
  @client_token = Braintree::ClientToken.generate
 
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
      @event.amount = []
      @event.amount << 0
      @event.participants =[]
      @event.participants << current_user.id
    else
      if @event.participants.include?(current_user.id.to_s)
         @index = @event.participants.index(current_user.id.to_s)
         @event.participants.delete(current_user.id.to_s)
         @event.amount.delete_at(@index)
      else
      @event.participants << current_user.id
      @event.amount << 0
      end
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
  def participants
    @event = Event.find(params[:id])
    @participants = @event.participants
  end
end
