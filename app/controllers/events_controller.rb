class EventsController < ApplicationController

  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.upcoming
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
    if @event.save
      redirect_to @event, notice: "#{@event.name} created successfully!"
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "#{@event.name} successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, alert: "#{@event.name} deleted successfully!"
  end

  private
    def event_params
      params.require(:event).
        permit(:name, :description, :location, :price, :starts_at, :image_file_name, :capacity)
    end

    def find_event
      @event = Event.find(params[:id])
    end

end
