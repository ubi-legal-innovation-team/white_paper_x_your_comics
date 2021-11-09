class AdminController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  
  def welcome
    render :welcome
  end

  def dashboard
    render :dashboard
  end
end