class PagesController < ApplicationController
  include AjaxSearch

  def home
    @projects = Project.all
    @markers  = {}

    @projects.each { |project|

      region      = Country.find_by_name(project.countries.first).region
      position    = Country.find_by_name(project.countries.first).position
      coordinates = [region,position]

      if @markers[coordinates].nil?
        @markers[coordinates] = [].push(project.id)
      else
        @markers[coordinates].push(project.id)
      end

    }

    render :home
  end

  def map_projects_search
    ajax_map_projects_search
    render partial: "/ajax/ajax_results/map_projects"
  end

  def definition
    render :definition
  end

  def perspectives
    render :perspectives
  end

  def resources
    render :resources
  end

  def join
    @requester = Requester.new
    render :join
  end

  def about
    render :about
  end

  def project
    if params[:lang] == "fr"
      @project = Project.friendly.find(params[:id])
      @version = @project.bodies.find_by(version:"FR")
    else
      @project = Project.friendly.find(params[:id])
      @version = @project.bodies.find_by(version:"EN")
    end

    respond_to do |format|
      format.html { render :project }

      format.pdf do
        PrintablePdf.create(project_id:@project.id,user_agent_id:@agent.id)

        pdf = Prawn::Document.new
        ProjectPdf.new(pdf,@project,@version,params)

        send_data pdf.render,
          filename: "#{@project.title}.pdf",
          type: 'application/pdf',
          disposition: 'inline'      
      end
    end
  end
end
