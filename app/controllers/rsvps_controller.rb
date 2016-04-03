class RsvpsController < ApplicationController

  def create
  	event = Event.find(params[:event_id])
  	@rsvp = Rsvp.new( :is_going => true, :user_id => current_user.id, :event_id => event.id )
  	event.rsvps << @rsvp
  	
	if @rsvp.save
	  redirect_to event, notice: 'See you there.'
	else
	  redirect_to event, notice: 'ERROR'
	end
  end

  def update
  end

private
	# Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:rsvp).permit(:is_going, :event_id)
    end
end
