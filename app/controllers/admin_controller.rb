class AdminController < ApplicationController
  layout "admin"
  include Pagy::Backend
  before_action :authenticate_user!
  
  def welcome
    render :welcome
  end

  def dashboard
    @pagy_requesters, @requesters = pagy(Requester.all, page_param: :page_requesters, items_param: :items_requesters)
    @requesters_count             = Requester.count

    render :dashboard
  end

  def requesters_index
    @requesters = Requester.all

    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=requesters.xlsx"
      }
      format.html { render :requesters_index }
    end
  end
end