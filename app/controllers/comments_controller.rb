class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
  	event = Event.find(comment_params[:event_id])
  	@comment = Comment.new( comment_params )
  	event.comments << @comment

  	if @comment.save
  		redirect_to event, notice: 'Comment Saved'
  	else
  		redirect_to event, notice: 'ERROR'
  	end
  end

  def destroy
  	@comment.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new
  	@comment = Comment.new
  end

  private
	# Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :event_id, :body)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end
end
