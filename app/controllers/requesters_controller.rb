class RequestersController < ApplicationController
  def create
  	@requester = Requester.new(strong_params)

  	if @requester.save
  		flash[:notice]   = t('join.valid_message')
  		redirect_to join_path(lang:params[:lang])
  	else
  		flash[:alert]           = t('join.error_message.flash')
      flash[:errors_messages] = @requester.errors.messages
      redirect_to join_path(lang:params[:lang])
  	end
  end

  private

  def strong_params
  	params.require(:requester).permit(:first_name,:last_name,:email,:country,:job_title,:reason,:message)
  end
end