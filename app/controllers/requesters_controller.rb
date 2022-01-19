class RequestersController < ApplicationController
  def create
  	@requester = Requester.new(strong_params)

  	if @requester.save
  		flash[:notice] = t('join.valid_message')
  		redirect_to join_path(lang:params[:lang])
  	else
  		flash[:alert]  = t('join.error_message.flash')
      flash[:errors] = @requester.errors.messages
      redirect_to join_path(
        lang:params[:lang],
        first_name:strong_params[:first_name],
        last_name:strong_params[:last_name],
        email:strong_params[:email],
        country:strong_params[:country],
        job_title:strong_params[:job_title],
        reason:strong_params[:reason],
        message:strong_params[:message])
  	end
  end

  private

  def strong_params
  	params.require(:requester).permit(:first_name,:last_name,:email,:country,:job_title,:message,:consent,reason:[])
  end
end