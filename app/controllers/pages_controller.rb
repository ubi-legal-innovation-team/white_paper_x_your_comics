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

    add_breadcrumb "home", :root_path
  end

  def map_projects_search
    ajax_map_projects_search
    render partial: "/ajax/ajax_results/map_projects"
  end

  def definition
    add_breadcrumb "definition", :definition_path
  end

  def perspectives
    add_breadcrumb "perspectives", :perspectives_path
  end

  def resources
    add_breadcrumb "resources", :resources_path
  end

  def join
    @requester = Requester.new
    add_breadcrumb "join", :join_path
  end

  def about
    add_breadcrumb "about", :about_path
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
      format.html { add_breadcrumb "#{@project.title}", :project }

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

  def robots
    # Don't forget to delete /public/robots.txt
    respond_to :text
  end
end
