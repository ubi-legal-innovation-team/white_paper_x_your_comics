class AdminController < ApplicationController
  layout "admin"
  include Pagy::Backend
  before_action :authenticate_user!
  
  def welcome
    render :welcome
  end

  def dashboard
    @pagy_requesters, @requesters = pagy(Requester.all.order(:created_at), page_param: :page_requesters, items_param: :items_requesters)
    @requesters_count             = Requester.count

    render :dashboard
  end

  def update_requesters
    if params[:contacted]
      @requesters = Requester.find(params[:contacted])
      @requesters.each {|requester| requester.update(contacted:true)}
      
      flash[:notice] = "The selection was successfully updated."
    else
      flash[:alert] = "Nothing to update."
    end

    redirect_to admin_dashboard_path
  end

  def requesters_index
    @requesters = Requester.all

    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=LDC_requesters.xlsx"
      }
      format.html { render :requesters_index }
    end
  end
end