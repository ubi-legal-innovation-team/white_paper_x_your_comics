class AdminController < ApplicationController
  layout "admin"
  include Pagy::Backend
  before_action :authenticate_user!
  before_action :authorize_admins

  def welcome
    if @authorize_admins.include? current_user.email
      render :welcome
    else
      render :dashboard
    end
  end

  def dashboard
    render :dashboard
  end

  def requesters
    @pagy_requesters, @requesters = pagy(Requester.all.order(:created_at), page_param: :page_requesters, items_param: :items_requesters)
    @requesters_count             = Requester.count

    render :requesters
  end

  def requester_excel
    @requester = Requester.find(params[:id])

    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=LDC_requester_#{@requester.last_name}.xlsx"
      }
      format.html { render :requester_excel }
    end
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
    @project = Project.friendly.find(params[:id])
    
    render :project_show
  end

  def update_requesters
    if params[:contacted_ids] || params[:unsubscribe_ids]

      if params[:contacted_ids]
        @requesters = Requester.find(params[:contacted_ids].map(&:to_i))
        @requesters.each {|requester| requester.update(contacted:true)}
      end

      if params[:unsubscribe_ids]
        @requesters = Requester.find(params[:unsubscribe_ids].map(&:to_i))
        @requesters.each {|requester| requester.update(unsubscribe:true)}
      end
      
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
    @pagy_printables, @printables = pagy(PrintablePdf.all.order(:created_at), page_param: :page_printables, items_param: :items_printables)
    @printables_count             = PrintablePdf.count

    @pagy_agents, @agents = pagy(UserAgent.all.order(:created_at), page_param: :page_agents, items_param: :items_agents)
    @agents_count         = UserAgent.count

    @top_location  = @agents.pluck(:countries).flatten.max_by {|i| @agents.pluck(:countries).flatten.count(i)}
    @top_city      = @agents.pluck(:cities).flatten.max_by {|i| @agents.pluck(:cities).flatten.count(i)}
    @top_printable = @printables.pluck(:project_id).flatten.max_by {|i| @printables.pluck(:project_id).flatten.count(i)}
    @top_printable = @top_printable.nil? ? "n/a" : Project.friendly.find(@top_printable).title

    render :analytics
  end

  def analytics_excel
    @agents     = UserAgent.all
    @printables = PrintablePdf.all

    @top_location  = @agents.pluck(:countries).flatten.max_by {|i| @agents.pluck(:countries).flatten.count(i)}
    @top_city      = @agents.pluck(:cities).flatten.max_by {|i| @agents.pluck(:cities).flatten.count(i)}
    @top_printable = @printables.pluck(:project_id).flatten.max_by {|i| @printables.pluck(:project_id).flatten.count(i)}
    @top_printable = @top_printable.nil? ? "n/a" : Project.friendly.find(@top_printable).title

    array1 = @agents.pluck(:countries)
    array2 = @agents.pluck(:cities)
    array3 = @printables.pluck(:project_id).map{|id| Project.find(id).title}
    array4 = array1 + array2 + Array.new(1) { array3 }

    @hash1 = {}
    array4.each_with_index { |array,index|
      array.each_with_index { |el,ind| 
        if @hash1[ind].nil?
          @hash1[ind] = []
        end  

        @hash1[ind][index] = el
      } 
    }
    
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=LDC_analytics.xlsx"
      }
      format.html { render :analytics_excel }
    end
  end

  def sandbox
    if current_user.email == "arthur.dhuy@ubisoft.com"
      render :sandbox
    else
      render :welcome
    end
  end

  private

  def authorize_admins
    @authorize_admins = [ 'alexandra.doornaert@ubisoft.com', 'arthur.dhuy@ubisoft.com', 'marie-lorraine.chiriacopol@ubisoft.com',
                          'geoffrey.delcroix@ubisoft.com', 'jean-philippe.doho@ubisoft.com', 'victor.fevre@ubisoft.com' ]
  end
end