class RequestersController < ApplicationController
  def create
  	@requester = Requester.new(strong_params)

  	if @requester
  		flash[:notice] = "Your request was successfully sent."
  		redirect_to join_path
  	else
  		flash[:alert] = "Sorry something went wrong."
  		redirect_to join_path
  	end
  end

  private

  def strong_params
  	params.require(:requester).permit(:first_name,:last_name,:email,:country,:job_title,:reason,:message)
  end
end