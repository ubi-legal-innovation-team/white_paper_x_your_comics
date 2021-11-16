class ProjectsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  
  def create
  end

  def update
  end

  private

  def strong_params
  	params.require(:project).permit()
  end
end