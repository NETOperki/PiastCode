class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def js_map
    event = Event.find_by(id: params[:id])
    pos = event.where.split ','

    render :json => {lat: pos.first.to_f, lng: pos.second.to_f}
  end
end
