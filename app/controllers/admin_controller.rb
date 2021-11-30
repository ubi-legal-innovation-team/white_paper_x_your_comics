class AdminController < ApplicationController
  layout "admin"
  include Pagy::Backend
  before_action :authenticate_user!

  def welcome
    render :welcome
  end

  def dashboard
    @authorize_admins = [ 'alexandra.doornaert@ubisoft.com', 'arthur.dhuy@ubisoft.com', 'marie-lorraine.chiriacopol@ubisoft.com',
                          'geoffrey.delcroix@ubisoft.com' ]
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

  def project_new
    @project = Project.new

    render :project_new
  end

  def project_show
    @project = Project.find(params[:id].to_i)
    
    render :project_show
  end

  def update_requesters
    if params[:contacted_ids]      
      @requesters = Requester.find(params[:contacted_ids].map(&:to_i))
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

  def analytics
    @agents     = UserAgent.all
    @printables = PrintablePdf.all

    @top_location  = @agents.pluck(:countries).flatten.max_by {|i| @agents.pluck(:countries).flatten.count(i)}
    @top_city      = @agents.pluck(:cities).flatten.max_by {|i| @agents.pluck(:cities).flatten.count(i)}
    @top_printable = @printables.pluck(:project_id).flatten.max_by {|i| @printables.pluck(:project_id).flatten.count(i)}
    @top_printable = Project.find(@top_printable).title

    render :analytics
  end
end