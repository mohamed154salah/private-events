class AttendacesController < ApplicationController


  def create
    @event = Event.find(params[:event_id])
    hattendace = Attendace.new(attendee_id: current_user.id, attended_event_id: @event.id)
    if hattendace.save
      flash[:notice] = "You have successfully registered for the event"
      redirect_to root_path
    else
      flash[:alert] = "An error has occurred, please try again"
      redirect_to event_path(event)
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @attendace = Attendace.find_by(attended_event_id:params[:event_id], attendee_id: current_user.id)
    if @attendace.destroy
      flash[:notice] = "You have successfully unregistered for the event"
      redirect_to root_path
    else
      flash[:alert] = "An error has occurred, please try again"
      redirect_to event_path(event)
    end
  end
end
