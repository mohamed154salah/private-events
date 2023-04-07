class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  def get_events
    @events = Event.all
    render json: @events
  end

  def show
    @event = Event.find(params[:id])
  end
  def new
    @event =current_user.events.build
  end

  def create
    @event=current_user.events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      puts "Couldn't create event"
      render 'new'
    end

  end
  ## This method is used to check if the current user is attending the event but it is not working
  def check_event_status
    flag = false
    @event.attendee.each do |attendee|
      attendee.id == current_user.id ? flag = true : flag = false
    end
    return flag
  end

  private

  def event_params
    params.require(:event).permit(:name, :event_date, :lacation)
  end

end
