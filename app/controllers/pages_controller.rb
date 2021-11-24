class PagesController < ApplicationController
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
      @project = Project.find(params[:id].to_i)
      @version = @project.bodies.find_by(version:"FR")
    else
      @project = Project.find(params[:id].to_i)
      @version = @project.bodies.find_by(version:"EN")
    end
    render :project
  end
end
