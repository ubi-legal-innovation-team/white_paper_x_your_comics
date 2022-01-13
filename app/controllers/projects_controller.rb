class ProjectsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :find_project, only: [ :update, :destroy ]
  
  def create
    @project = Project.new(strong_params)

    if @project.save
      flash[:notice] = "The project was successfully created."
      redirect_to admin_project_show_path(id:@project,slug:params[:slug])
    else
      flash[:errors] = @project.errors.messages
      flash[:alert]  = "An error occured, please try again."
      redirect_to admin_new_project_path(slug:params[:slug])
    end
  end

  def update
    if @project.update(strong_params)
      flash[:notice] = "The project was successfully updated."
      redirect_to admin_project_show_path(id:@project,slug:params[:slug])
    else
      flash[:errors] = @project.errors.messages
      flash[:alert]  = "An error occured, please try again."
      redirect_to admin_project_show_path(id:@project,slug:params[:slug])
    end
  end

  def destroy
    if @project.destroy
      flash[:notice] = "The project was successfully deleted."
      redirect_to admin_projects_path(slug:params[:slug])
    else
      flash[:errors] = @project.errors.messages
      flash[:alert]  = "An error occured, please try again."
      redirect_to admin_projects_path(slug:params[:slug])
    end
  end

  private

  def find_project
    @project = Project.friendly.find(params[:id])
  end

  def strong_params
  	params.require(:project).permit(:title,:company,:actor,:contact,:media,:imagery,stakes:[],countries:[],
      bodies_attributes: [ :id, :version, :short_description, :long_description,:question_one,:question_two,:question_three,:question_four,
       :question_five,:question_six,:question_seven 
      ]
    )
  end
end

