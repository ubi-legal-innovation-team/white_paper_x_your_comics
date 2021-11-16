class ProjectsController < ApplicationController
  def update
  	if Project.first.update(strong_params)
  		flash[:notice] == "GOOD"
  		redirect_to sandbox_path
  	end
  end

  private

  def strong_params
  	params.require(:project).permit(:imagery)
  end
end