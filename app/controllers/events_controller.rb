class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    @event.when = event_when
    @event.user = User.first
    @event.save

    redirect_to @event
  end

  def js_map
    event = Event.find_by(id: params[:id])
    pos = event.where.split ','
    render :json => {lat: pos.first.to_f, lng: pos.second.to_f}
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :where)
    end

    def event_when
      params[:event][:when].to_datetime
    end

end
