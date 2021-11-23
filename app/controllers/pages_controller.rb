class PagesController < ApplicationController
  def home
    @projects = Project.all
    @markers  = Country.where("name IN (?)", @projects.pluck(:countries).flatten).pluck(:region,:position)

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
