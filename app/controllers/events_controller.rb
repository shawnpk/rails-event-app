class EventsController < ApplicationController

  before_action :find_event, only: [:show, :edit, :update]

  def index
    @events = Event.all
  end

  def show
    
  end

  def new
    @event = Event.new
  end

  def edit
    
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to @event
  end

  def update
    
    @event.update(event_params)
    redirect_to @event
  end

  private
    def event_params
      params.require(:event).
        permit(:name, :description, :location, :price, :starts_at)
    end

    def find_event
      @event = Event.find(params[:id])
    end

end
