class AdminController < ApplicationController
  layout "admin"
  
  def welcome
    render :welcome
  end
end
