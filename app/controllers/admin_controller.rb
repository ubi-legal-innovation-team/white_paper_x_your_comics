class AdminController < ApplicationController
  layout "admin"
  include Pagy::Backend
  before_action :authenticate_user!
  
  def welcome
    render :welcome
  end

  def dashboard
    render :dashboard
  end

  def requesters
    @pagy_requesters, @requesters = pagy(Requester.all.order(:created_at), page_param: :page_requesters, items_param: :items_requesters)
    @requesters_count             = Requester.count

    render :requesters
  end

  def projects
    @pagy_projects, @projects = pagy(Project.all.order(:title), page_param: :page_projects, items_param: :items_projects)
    @projects_count           = Project.count

    render :projects
  end

  def project_show
    @project = Project.find(params[:id])
    
    render :project_show
  end

  def update_requesters
    if params[:contacted]
      @requesters = Requester.find(params[:contacted])
      @requesters.each {|requester| requester.update(contacted:true)}
      
      flash[:notice] = "The selection was successfully updated."
    else
      flash[:alert] = "Nothing to update."
    end

    redirect_to admin_requesters_path
  end

  def requesters_excel
    @requesters = Requester.all

    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=LDC_requesters.xlsx"
      }
      format.html { render :requesters_excel }
    end
  end
end