class PagesController < ApplicationController
  def home
    render :home

  end

  def welcome
    render layout: 'welcome'

  end
end
