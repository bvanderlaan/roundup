class RsvpsController < ApplicationController

  def create
  	event = Event.find(params[:event_id])

  	@rsvp = Rsvp.new( :is_going => params[:is_going], :user_id => current_user.id, :event_id => event.id )
  	event.rsvps << @rsvp
  	
  	if @rsvp.save
      message = params[:is_going] == '1' ? 'See you there!' : "Sorry we won't see you."
  	  redirect_to event, notice: message
  	else
  	  redirect_to event, notice: 'ERROR'
  	end
  end

  def update
    rsvp = Rsvp.find(params[:id])
    rsvp.is_going = params[:is_going]

    if rsvp.save
      message = params[:is_going] == '1' ? 'See you there!' : "Sorry we won't see you."
      redirect_to rsvp.event, notice: message
    else
      redirect_to rsvp.event, notice: 'ERROR'
    end
  end

private
	# Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:rsvp).permit(:is_going, :event_id)
    end
end
