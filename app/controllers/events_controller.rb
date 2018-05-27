class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(id: params[:id])
    @joined = nil
    if not current_user.nil? then
      @joined = @event.joined().where(user_id: current_user)
    end
  end

  def new
    if not logged_in? then
      flash[:negative] = "Zaloguj się, aby mieć możliwość dodania nowego wydarzenia."
      redirect_to events_path
    end
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
    @event.user = current_user
    if @event.save then
      return redirect_to @event
    end
    render 'new'
  end

  def join_event
    if current_user.nil? then
      flash[:negative] = "Nie jesteś zalogowany do systemu."
      redirect_to root_path
    end

    event = Event.find_by(id: params[:id])
    join = event.joined.new user: current_user
    join.save
    redirect_to event
  end

  def leave_event
    @event = Event.find_by(id: params[:id])
    @event.joined().where(user_id: current_user).destroy_all

    redirect_to @event
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :where, :category)
    end

    def event_when
      params[:event][:when].to_datetime
    end
end
