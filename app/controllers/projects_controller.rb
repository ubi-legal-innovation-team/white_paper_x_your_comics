class ProjectsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  
  def create
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(strong_params)
      flash[:notice] = "The project was successfully updated."
      redirect_to admin_project_show_path(@project)
    else
      flash[:errors] = @project.errors.messages
      flash[:alert]  = "An error occured, please try again."
      redirect_to admin_project_show_path(@project)
    end
  end

  private

  def strong_params
  	params.require(:project).permit(:title,:company,:actor,:contact,:media,:imagery,stakes:[],countries:[],
      bodies_attributes: [ :version, :short_description, :content ])
  end
end

