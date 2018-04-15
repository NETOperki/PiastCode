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

  def find
    search_query = params[:query]
    @events = Event.where('title like ?', "%#{search_query}%")
    render layout: false
  end

  def create
    @event = Event.new event_params
    @event.when = event_when
    @event.user = User.first
    @event.save

    redirect_to @event
  end

  def join_event
    event = Event.find_by(id: params[:id])
    join = event.joined.new user: User.first
    join.save

    redirect_to event
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :where, :category)
    end

    def event_when
      params[:event][:when].to_datetime
    end
end
